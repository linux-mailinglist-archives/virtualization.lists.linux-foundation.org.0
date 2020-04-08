Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CC21A1DCE
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 11:05:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3EC8387C89;
	Wed,  8 Apr 2020 09:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ToKbBVmE1U9l; Wed,  8 Apr 2020 09:05:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F58387C30;
	Wed,  8 Apr 2020 09:05:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D4F4C0177;
	Wed,  8 Apr 2020 09:05:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8298C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B47A386928
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAnVWM7zQAFV
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:05:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BAB2B85EAF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:05:53 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c12so2306039plz.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Apr 2020 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=zWrnZumKf5bZt8iAgpjrXn5wo7mCnnfGiyN1FLjpUEg=;
 b=WBGoF51nW9TgSD+3xZPoXnxuS7b8ZGExHJ6EYQMdbiWseff2VabDmVCNmNVup2zbb9
 De096lx/fOJflD+HrRRqwi+LGDgUeR82q4LxH+Ex1GP6xXc4NYMlr+RepPFufu8PTP41
 WlZ/NItcEQgJBmL402dXYdVhRs7I66lBedr/PmFgELtbBWuFt4t7mraWqud+mbBklsSz
 NEs37PvvLs7yopuFK8taRVjo1Gl2kJhEbWg3VdfYyqdU4pUJxANLim4QbgI2l2I913cu
 2ITAMGchpP+A/6QMrLTLsCXxDhRiR1lmdxuLVkaeQzoJD7PmnHfTVtJJXkeSZD6dav9X
 QKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=zWrnZumKf5bZt8iAgpjrXn5wo7mCnnfGiyN1FLjpUEg=;
 b=kiIRilxSjb0MeqLYDjSRsGqh0FnTbQRONcjEEN6In9iNOqNrKlqoVjY7EblsnV5wK+
 WaF1lMrQZXxv+rUzxOYXyXjQBJjP0cB8Go0Gy8EzEPzumWCLxkNXDACpAD3O5J0bAuYI
 yLyBBC0SfU6/F5H9OtUpn3fW1IHRLsHt/m5jiFZA9V03ow8JL/7b23WcO0eEvdKvTO8h
 5y5tGinJQLI9Tgzki4z9nhQG3wPctXffvE/rkwHD7NOACQQRNbhePXl1vNZH2mEiEcqZ
 MSeEXhH0BCllcnpXWuUDkQ1tU7uYU7RtXB0vhEHIgx0THDm7WGFo8uy+GT7ZBt387iAL
 mtFA==
X-Gm-Message-State: AGi0Pubk6TxsyjHErlNArKBsfCwvyewJraIdb7b4Kdgso9ywAko/yByg
 uUuOUAPXMtpVsrFT4POxG3U=
X-Google-Smtp-Source: APiQypK4p/yNichAvxmzAD+45+X2dCoTSk8gQsSpI5BSWQ4i68DUiAPCApopRlWp7EE4iQWLpr26Kw==
X-Received: by 2002:a17:90a:9e9:: with SMTP id
 96mr4162401pjo.168.1586336753366; 
 Wed, 08 Apr 2020 02:05:53 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
 by smtp.gmail.com with ESMTPSA id t1sm3743315pjf.26.2020.04.08.02.05.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 02:05:52 -0700 (PDT)
From: Huacai Chen <chenhc@lemote.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/3] target/mips: Support variable page size
Date: Wed,  8 Apr 2020 17:14:08 +0800
Message-Id: <1586337250-25149-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 virtualization@lists.linux-foundation.org, Fuxin Zhang <zhangfx@lemote.com>,
 Huacai Chen <chenhc@lemote.com>, spice-devel@lists.freedesktop.org
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

Traditionally, MIPS use 4KB page size, but Loongson prefer 16KB page
size in system emulator. So, let's define TARGET_PAGE_BITS_VARY and
TARGET_PAGE_BITS_MIN to support variable page size.

Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 target/mips/cpu-param.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index 308660d..9c4a6ea 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -23,7 +23,12 @@
 #  define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 #endif
+#ifdef CONFIG_USER_ONLY
 #define TARGET_PAGE_BITS 12
+#else
+#define TARGET_PAGE_BITS_VARY
+#define TARGET_PAGE_BITS_MIN 12
+#endif
 #define NB_MMU_MODES 4
 
 #endif
-- 
2.7.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
