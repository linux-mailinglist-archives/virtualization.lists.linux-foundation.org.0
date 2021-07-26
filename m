Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 747703D52AD
	for <lists.virtualization@lfdr.de>; Mon, 26 Jul 2021 06:52:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162B882EF1;
	Mon, 26 Jul 2021 04:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZREd6Q-HS219; Mon, 26 Jul 2021 04:52:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F314282E19;
	Mon, 26 Jul 2021 04:52:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83507C000E;
	Mon, 26 Jul 2021 04:52:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D4A4C001A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 406224016A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEpEEYWCX82X
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:52:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B118C4028F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 04:52:12 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso9525163pjq.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 21:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eK8DOqvzTIA+QnY/7E9eUfZzzNYH4fK9bj2nYZkAiVA=;
 b=SoRDc4f/lRhAl74xoIPjFbw7Dib8Di56QspJCEXHcsSsoeG2PeHGJBe7RwI/R3vTUE
 qM+bG+qGXc43mEFOcG+GGkFNDsJzFeTeLfbJOeJ2IvHxCxqqqu6BQcz0bika3Vl8I4BA
 Vi4felRcJuq3De1PlLHQxAPiHhG18JWn+YH1mIMh7dCzUTaba7W3bHHv55BEUPOgvlEP
 rezZd1ukuSYTrpRfZ1kJRxPqYBhZf8G4shxpmyUx7dxUp/Nh4tWnAy2nGbbWJx4j2q1v
 xojUc0myLSYEUrOuZ0j6rCHBwckaDzDSNBB1WDt84nMEbnG867niEdPx7BzOGqDna7pw
 YRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eK8DOqvzTIA+QnY/7E9eUfZzzNYH4fK9bj2nYZkAiVA=;
 b=AmoIPiTyUaBnqBuRRc92cVJrAjGSVwQDJnhvcFl7vfuad+K+nwzMfBt2x5SPukM4u0
 CBkIEVZapLmR0b5olohRkgjAmnLnP6nB+den9hiYsynissaR2lFIq6Xher33TkWQMoY0
 ASsBu3YlUTTlrLedEgrmDUlbiVV2tDDuIueq38iJXH7dfcn5CExHsvhYV2evsV+hZecj
 uRMy5y5lEceCbw1VWw4K7suseQ3k1ar42UC4tX45QJthcAnKK9YQw5ntCN3av+Vk3DC5
 hz9gbazBvj+lamoopvBQoHKkGBHDJOFoAcSJanqQ8tXY1EMolEc+PaiK+CN08X8uSC/i
 igJg==
X-Gm-Message-State: AOAM533ZXnnsS0X+IqrGC4TF8/fOG+ltLZ1ucPoCD5l2qcOyTp02yjLV
 sW4LoEmQtCjAvbtzsvQuhwe2mg==
X-Google-Smtp-Source: ABdhPJyd4mgd3OPdX6e88ye0hFUu3QCPJP564ICYV8w64E0FtjTKjaHwg2AFqqamONRyDAfxaOfUNg==
X-Received: by 2002:a17:90b:609:: with SMTP id
 gb9mr7453554pjb.156.1627275132187; 
 Sun, 25 Jul 2021 21:52:12 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id q19sm29598565pgj.17.2021.07.25.21.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 21:52:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH V3 4/5] uapi: virtio_ids: Sync ids with specification
Date: Mon, 26 Jul 2021 10:21:44 +0530
Message-Id: <9450f75be4d6fc6abd5f52c7ff75890f04303324.1627273794.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1627273794.git.viresh.kumar@linaro.org>
References: <cover.1627273794.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

This synchronizes the virtio ids with the latest list from virtio
specification.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/uapi/linux/virtio_ids.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 70a8057ad4bb..3c8e11820fdb 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -54,8 +54,20 @@
 #define VIRTIO_ID_SOUND			25 /* virtio sound */
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
+#define VIRTIO_ID_RPMB			28 /* virtio rpmb */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_VIDEO_ENCODER		30 /* virtio video encoder */
+#define VIRTIO_ID_VIDEO_DECODER		31 /* virtio video decoder */
+#define VIRTIO_ID_SCMI			32 /* virtio scmi */
+#define VIRTIO_ID_NITRO_SEC_MOD		33 /* virtio nitro secure module*/
+#define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
+#define VIRTIO_ID_WATCHDOG		35 /* virtio watchdog */
+#define VIRTIO_ID_CAN			36 /* virtio can */
+#define VIRTIO_ID_DMABUF		37 /* virtio dmabuf */
+#define VIRTIO_ID_PARAM_SERV		38 /* virtio parameter server */
+#define VIRTIO_ID_AUDIO_POLICY		39 /* virtio audio policy */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
+#define VIRTIO_ID_GPIO			41 /* virtio gpio */
 
 /*
  * Virtio Transitional IDs
-- 
2.31.1.272.g89b43f80a514

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
