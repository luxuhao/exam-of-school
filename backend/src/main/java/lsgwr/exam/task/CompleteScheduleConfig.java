package lsgwr.exam.task;

import lsgwr.exam.entity.Cron;
import lsgwr.exam.repository.CronRepository;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

@Configuration
@EnableScheduling
public class CompleteScheduleConfig implements SchedulingConfigurer {

    private final CronRepository cronRepository;

    public CompleteScheduleConfig(CronRepository cronRepository) {
        this.cronRepository = cronRepository;
    }
    /**
     * 执行定时任务.
     */
    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        List<Cron> cronList  = cronRepository.findAll();
        for (Cron cron : cronList) {
            // System.out.println(cron.getTaskName());
            final String cronDsc = cron.getCron(); // 获取 cron 表达式
            final String taskName = cron.getTaskName(); // 获取 定时任务名字
            taskRegistrar.addTriggerTask(
                    //1.添加任务内容(Runnable)
                    () -> System.out.println("执行***"+ taskName + "***" + LocalDateTime.now().toLocalTime()),
                    //1.设置执行周期(Trigger)
                    triggerContext -> {
                    //2 合法性校验.
                    if (StringUtils.isEmpty(cronDsc)) {
                        // Omitted Code ..
                    }
                    //3 返回执行周期(Date)
                        return new CronTrigger(cronDsc).nextExecutionTime(triggerContext);
                    }
            );
        }
    }

}