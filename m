Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93B3C6E0A
	for <lists.virtualization@lfdr.de>; Tue, 13 Jul 2021 11:56:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A22B405BE;
	Tue, 13 Jul 2021 09:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gB5TvPJXpzPb; Tue, 13 Jul 2021 09:56:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CC23F405C0;
	Tue, 13 Jul 2021 09:56:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D5BDC0022;
	Tue, 13 Jul 2021 09:56:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C515AC0010
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 09:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D3F405BE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 09:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DExn4l0P0_6O
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 09:56:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4E27405C0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 09:56:07 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d1so5612124plg.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EmK9PBBZm27px4+TQvTc+ITdi0A77m08kRzVEcaDoek=;
 b=KSYePS7AqCIh6CTacy8i+2I8sKpsyzPU/hYta21A1pWxmMtnKvp8IK2Tsp9kRuPOXx
 c69jMlkZFZApxFtJ7AVbeJIfC/bnmqHLSgkWTNEvp2pT/gpsf8Mozs4X+liuBpVevzPZ
 syS0M7RSd44GqNEAT3+jRAJp8nP4fRrRugGk5yO/vQFgExxIRHsQ1tYmDfMRCbbpP+uF
 2DBTQuklegchn1jAnhhZkT0gQQvTdR77MMww0p7dt9+Lx9wu0Y7Bft072QkAoKf/eaWD
 6qBuvCVDoBSOBZTeGkGW/rXPRU9vnvLihpOhpO4wbkYLUAbLMAxvTpu0/mko38Ik+a2P
 MqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EmK9PBBZm27px4+TQvTc+ITdi0A77m08kRzVEcaDoek=;
 b=X7ktQUPoMMABI8menMSwafNDaF3yFfEgt1pBmUie+bfv/55A2J4shCh2aporVD+ubq
 15+ELo/a54pXkybXOjQW1BbPrl/5Jqvrf4uUM7x0acGW/3hfxfv91VVHZRtfPBp71qn4
 cqbOi8Op2FwTq7jpN6GQd4um04tBzu7PJnHZbn0lsc2Qda5i+w4wieFm1nWRh0GrVSVA
 m3R01LKHtrF2AxeGvbHgps8MkrmJrDtYfdVwTvl0liz/MNLfeUGcj+peTLeJixskJ5Ay
 D7qkWIiXcaGGEtI5+MXHH4SWWOblWvIyZ/cglbi+csfhckbAKBWAWh+Q4O3EHijaPk0v
 +Xmw==
X-Gm-Message-State: AOAM531Knhtpr1nTuASKGEq8dEmd4t3Hc7nFDt+8KcDsax8ih923vO1V
 Bnm9Y5sFGUd6vCpwu5Fllpz2oQ==
X-Google-Smtp-Source: ABdhPJwbbH02eJRKhfqiniDFu1JoI7NqedZe50yDy1/qYd4UnALxOiIFCymtmtYDK9PeFL2NOCT/UA==
X-Received: by 2002:a17:90a:520e:: with SMTP id
 v14mr18228984pjh.163.1626170166988; 
 Tue, 13 Jul 2021 02:56:06 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id d15sm5650092pfl.82.2021.07.13.02.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:56:06 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] uapi: virtio_ids: Add VIRTIO_ID_GPIO from OASIS spec
Date: Tue, 13 Jul 2021 15:25:55 +0530
Message-Id: <7c716c2eb7ace5b5a560d8502af93101dbb53d24.1626170146.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Add GPIO's device type ID from the OASIS virtio spec.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 99aa27b100bc..477a0927e329 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -57,6 +57,7 @@
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
 #define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
+#define VIRTIO_ID_GPIO			41 /* virtio GPIO */
 
 /*
  * Virtio Transitional IDs
-- 
2.31.1.272.g89b43f80a514

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
