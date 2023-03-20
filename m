Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF56C0E88
	for <lists.virtualization@lfdr.de>; Mon, 20 Mar 2023 11:18:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2EB4087A;
	Mon, 20 Mar 2023 10:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2EB4087A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yueYhhTL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvN6OZ-crBwc; Mon, 20 Mar 2023 10:18:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9002040544;
	Mon, 20 Mar 2023 10:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9002040544
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2E35C0089;
	Mon, 20 Mar 2023 10:18:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEA3BC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 10:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B31F881463
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 10:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B31F881463
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=yueYhhTL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hkfu5REdaLYh
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 10:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4401B8145F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4401B8145F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 10:18:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p16so7088446wmq.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Mar 2023 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112; t=1679307502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fycKRT8rPRiN1RToNPzVUtbiphKXy5oAKPOU8x+y8tk=;
 b=yueYhhTLH5sP34Wkg/oxG/+Aow0ekHUtOvDxbFlnjIFoxMA6IxYp28yhcP2Ye+jZBu
 hVwxqQH97HKR63ohwnF5ame9i7N4DF2D97kXuMwt8eN08HVm37RbASyuhIfXy0QbDiWB
 bIcXzZX/fyK50v1x8tZtKFObuAeYIKtJdSl17zwUJ4Hq/3bZ59kyCMB68Iq1pP5wpqSX
 fdNbkaAhDX3CpSqoDLB/e5ulWzq3pMUKJfFE0xZL6iBSo1LkDtMrr5OOBkoGhu6nu70S
 DJGZR9o0131fx/JCOMDagBUq5VUbKvavjn9GqsizUheWkeQmFoDs/tBkaxjBcfgUtSTe
 qgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fycKRT8rPRiN1RToNPzVUtbiphKXy5oAKPOU8x+y8tk=;
 b=lh35TAX1nx8rBZFDPxeEcXx9Vldx9ivD8erfUt9x35aGv+7JQOYI9N4+E3FveKzltd
 ODhkJaQpcfC3OzRHGnglHnH/NK9AQGc63dFJkh+DTj3upx7BHT7dkMewEefPwDViuAa8
 0NLhB90SCVMCPyASe+5Ed3XL/6Hd1ftLD0HIL6y5GDTUh8jufyfZBwHiGqL5Hbzg0qU2
 ghcEr4+GmMYLRi0u9ci/QipVsPe9MwE7RuDdyj2Wh0AxtSpKdUBM8blGIQ0QEwHxkNTx
 IZj5/w3F3VYgjcIHbcGHAgf5nk1s4FSVQ1+JwKBd60yyGwTpaUlA8PsKJqbN55nFGW56
 08lw==
X-Gm-Message-State: AO0yUKVlEDr3ED+0MxTlzQxnvbK2y8T6kx3xxzQuRThy+iU/XpWCjfFf
 DPD2DnxPlt19pmx65W7qukfT4h9vuEylVT34nLg=
X-Google-Smtp-Source: AK7set8dtJKH2ba/XUGetmGFllzsRsWBxK/9Nwl6p58Bhg0PME/q7jAQi95sS0SZGQWyziXbsJIG5Q==
X-Received: by 2002:a05:600c:a4c:b0:3ed:2e02:1c02 with SMTP id
 c12-20020a05600c0a4c00b003ed2e021c02mr19956306wmq.23.1679307501759; 
 Mon, 20 Mar 2023 03:18:21 -0700 (PDT)
Received: from alvaro-dell.. (bzq-84-110-153-254.static-ip.bezeqint.net.
 [84.110.153.254]) by smtp.gmail.com with ESMTPSA id
 q2-20020a1ce902000000b003ed1fa34bd3sm10031509wmc.13.2023.03.20.03.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:18:21 -0700 (PDT)
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 0/2] vdpa/snet: support [s/g]et_vq_state and suspend
Date: Mon, 20 Mar 2023 12:18:15 +0200
Message-Id: <20230320101817.680402-1-alvaro.karsz@solid-run.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Add more vDPA callbacks.

[s/g]et_vq_state is added in patch 1, including a new control mechanism
to read data from the DPU.

suspend is added in patch 2.

Alvaro Karsz (2):
  vdpa/snet: support getting and setting VQ state
  vdpa/snet: support the suspend vDPA callback

 drivers/vdpa/solidrun/Makefile     |   1 +
 drivers/vdpa/solidrun/snet_ctrl.c  | 324 +++++++++++++++++++++++++++++
 drivers/vdpa/solidrun/snet_hwmon.c |   2 +-
 drivers/vdpa/solidrun/snet_main.c  | 126 ++++++-----
 drivers/vdpa/solidrun/snet_vdpa.h  |  18 +-
 5 files changed, 400 insertions(+), 71 deletions(-)
 create mode 100644 drivers/vdpa/solidrun/snet_ctrl.c

-- 
2.34.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
