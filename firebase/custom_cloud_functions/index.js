const admin = require("firebase-admin/app");
admin.initializeApp();

const sendMessages = require("./send_messages.js");
exports.sendMessages = sendMessages.sendMessages;
const publishEditorsPickDaily = require("./publish_editors_pick_daily.js");
exports.publishEditorsPickDaily =
  publishEditorsPickDaily.publishEditorsPickDaily;
const flagUsersNeedingFeedback = require("./flag_users_needing_feedback.js");
exports.flagUsersNeedingFeedback =
  flagUsersNeedingFeedback.flagUsersNeedingFeedback;
const createSocialMediaContentMessage = require("./create_social_media_content_message.js");
exports.createSocialMediaContentMessage =
  createSocialMediaContentMessage.createSocialMediaContentMessage;
const scheduleQuoteNotifications = require("./schedule_quote_notifications.js");
exports.scheduleQuoteNotifications =
  scheduleQuoteNotifications.scheduleQuoteNotifications;
const sendScheduledNotifications = require("./send_scheduled_notifications.js");
exports.sendScheduledNotifications =
  sendScheduledNotifications.sendScheduledNotifications;
const scheduleNotificationsOnRegister = require("./schedule_notifications_on_register.js");
exports.scheduleNotificationsOnRegister =
  scheduleNotificationsOnRegister.scheduleNotificationsOnRegister;
