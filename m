Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C8389198C1A
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 08:10:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34BFC88515;
	Tue, 31 Mar 2020 06:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpn6sU-uQ9aD; Tue, 31 Mar 2020 06:10:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83ED0884ED;
	Tue, 31 Mar 2020 06:10:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DBD7C1D85;
	Tue, 31 Mar 2020 06:10:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26F6AC1D85
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0F4A52202C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cg8RYcxPRnCw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:10:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id E5CCF2002F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 06:10:06 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id v13so638308pjb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 23:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=7gDKMMIuCNqmz3/gFIq4MvPM1PkZWROW621H1HN1ayU=;
 b=YdSZ586ZUgz6lb4fgc0t9r8Jxl0i7MDKTTdEubCA94y0Y/lSiz3Igp2J+b73rVmKAp
 WU5NfS0PX4wBSXBJk49GmGvWvyzeX1+2oXcj601lkxqxAwSLXZwc2ZxYvg9rLZEqFt68
 c6ZAA6t2W27i28NDM7MwgTJV8E87k8vbH7JbSxgcD0R0DmvdjAV/f+dkkreNKkKNCUDO
 agfbOP28/ysqeYtE1zEppqKFhKQwjriGlxxqHONzXUmYrMliTMvw37yy5GCh080ZWeIz
 WJbPZCgAmk0nHSI1jC8MXbU6ycoq8bTgV9T5+NOjOxokdpHmI7rfnPISmJXhrxB2XAsH
 AVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=7gDKMMIuCNqmz3/gFIq4MvPM1PkZWROW621H1HN1ayU=;
 b=rc/xhPhg6D59BYFlTGrki09Y4jUahoPf2DZyzL68TqORyIQL9d/6B5/Q5Ck3Pqahkk
 geyuJfDPRBB8lRHLtdBmxsLBkuE2OAJ8I8gZzvOODaEa8+pRkuGuX3OeJ10u6ziIAPt9
 Hu07GBm328wbdIHcxbApBvkK5795ik/shs2QSpvhb16QbJIWf37RgCwl7Kd4vqximks5
 MlBkI+4Q3DNB+5pViJ9Ax0H72cUZUoJPKqWgY3HkLcQPJeoPrt2tTqWkufj+fFo3iGE4
 bQkIRANNDjckr+oBZ4kkTlQH70GHG+8Tw+ds3UoWR+ERdd24WoZFsRYnJTzv9oq1wnQB
 1skA==
X-Gm-Message-State: AGi0PuYhjjkuwR0F8v6a6XXwnXGxVXkxCHLiQ8KtT4bx3K3iCu8vWv66
 5MGohfC6XmaQSdfL1x8pWxQ=
X-Google-Smtp-Source: APiQypL6SM9R3Junk6mCmNdTFwzDZbZ4pRbnQMT67D/+476FqoDC4YGt7uTmufgFNPymKZG+5jOt3w==
X-Received: by 2002:a17:90a:3606:: with SMTP id
 s6mr2035567pjb.195.1585635006492; 
 Mon, 30 Mar 2020 23:10:06 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
 by smtp.gmail.com with ESMTPSA id r29sm10890190pgm.17.2020.03.30.23.10.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 30 Mar 2020 23:10:05 -0700 (PDT)
From: Huacai Chen <chenhc@lemote.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH Resend] drm/qxl: Use correct notify port address when creating
 cursor ring
Date: Tue, 31 Mar 2020 14:18:08 +0800
Message-Id: <1585635488-17507-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Cc: stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Fuxin Zhang <zhangfx@lemote.com>, Huacai Chen <chenhc@lemote.com>,
 spice-devel@lists.freedesktop.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The command ring and cursor ring use different notify port addresses
definition: QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR. However, in
qxl_device_init() we use QXL_IO_NOTIFY_CMD to create both command ring
and cursor ring. This doesn't cause any problems now, because QEMU's
behaviors on QXL_IO_NOTIFY_CMD and QXL_IO_NOTIFY_CURSOR are the same.
However, QEMU's behavior may be change in future, so let's fix it.

P.S.: In the X.org QXL driver, the notify port address of cursor ring
      is correct.

Cc: <stable@vger.kernel.org>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index bfc1631..9bdbe0d 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -218,7 +218,7 @@ int qxl_device_init(struct qxl_device *qdev,
 				&(qdev->ram_header->cursor_ring_hdr),
 				sizeof(struct qxl_command),
 				QXL_CURSOR_RING_SIZE,
-				qdev->io_base + QXL_IO_NOTIFY_CMD,
+				qdev->io_base + QXL_IO_NOTIFY_CURSOR,
 				false,
 				&qdev->cursor_event);
 
-- 
2.7.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
