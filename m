Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F591A1DD0
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 11:06:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6670520484;
	Wed,  8 Apr 2020 09:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLSJx-VieWb8; Wed,  8 Apr 2020 09:06:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5FFAD20480;
	Wed,  8 Apr 2020 09:06:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EABBC1AE8;
	Wed,  8 Apr 2020 09:06:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC569C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A163487C9A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v25ae9sLNxJh
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A4C2787C30
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 09:06:03 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id z3so902993pjr.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 08 Apr 2020 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SOR40jzBSUpqPa3YKI4axKYoQpchXwTjuvvVPeOFCJw=;
 b=g+de1RilNtHuXL1b9g7rrUxvsW/oRX6CZxuYoQD2EoVLs7x102LHXAOJAb3c8wffZl
 IZUv9KIOftiYesuIDZaO3++fxhZsteU1OVrtuoBpdd6IuA5wcOb0JDL4IjAhqMpHX0pW
 AVIBxhcjA/GhPN52AScD3UGm/zNJLM1AfHTuOX0vMmJVWOqi5xnpzuBacdgvg42hWDok
 3SyTJuAdWFfB4zkDwu+20+Zw99MIlDEm75RX4/KDwpHgBGit/hEbSiIMtpfH0V2WKbw3
 j5E0Ksk5Pl3dlQY9hm4alqGpsZcp+9T5JB0TnVkpXH2J00uycQDjJHnlNCZqqZZ3lw0/
 dqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=SOR40jzBSUpqPa3YKI4axKYoQpchXwTjuvvVPeOFCJw=;
 b=RBelUjSkrtTaohgJ/nufW4knNmutA5l6vtCE0CIW2d9QSL3GMPPxDU4Uynm8nKKolt
 y2BqGgyFzgrdpfTOTaiM7mPeJMf/av5LMM0OYPin9Oo6cUDpR3dQW60v+o3QO6Eu0HYC
 vaVdiqKJVQJeX5iASIE03JnFR3Jm8FUlETF38T3g7SH3yR5kSLYxynq1AXFWeiu1b0td
 YueWGFKjawzT6UlrEEEzvONQkydHyef2H3z6W4OGRduCvHz/hYx4bAezf/Ep3/zTW88C
 qapfVppck0J9+R+IM/AZ233ymEvxv4tLM8mDe1r6ynPaZph95omCW3qlbQBFYeFL8UPq
 Elbg==
X-Gm-Message-State: AGi0PuYBF8wk7vD1uEIIDSJ77SnV+fH4tMqYQ/xlY6kOg2ZNHvDTV5Az
 ZqOgHjNRHclMdmfD12HdK2I=
X-Google-Smtp-Source: APiQypLx4IwqYIw/MBG2TCgMoSa4TCV5BiycLCdUkM7+vBZTsk0GKf976Xc3zpuVqyFSYq+YO7LtBA==
X-Received: by 2002:a17:902:70c4:: with SMTP id
 l4mr6211948plt.136.1586336763284; 
 Wed, 08 Apr 2020 02:06:03 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
 by smtp.gmail.com with ESMTPSA id t1sm3743315pjf.26.2020.04.08.02.05.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 02:06:02 -0700 (PDT)
From: Huacai Chen <chenhc@lemote.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/3] mips/mips_fulong2e: Set preferred page size to 16KB
Date: Wed,  8 Apr 2020 17:14:09 +0800
Message-Id: <1586337250-25149-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1586337250-25149-1-git-send-email-chenhc@lemote.com>
References: <1586337250-25149-1-git-send-email-chenhc@lemote.com>
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

Loongson processor prefers 16KB page size in system emulator, so let's
define mc->minimum_page_bits to 14.

Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 hw/mips/mips_fulong2e.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 5040afd..23897d7 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -399,6 +399,7 @@ static void mips_fulong2e_machine_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("Loongson-2E");
     mc->default_ram_size = 256 * MiB;
     mc->default_ram_id = "fulong2e.ram";
+    mc->minimum_page_bits = 14;
 }
 
 DEFINE_MACHINE("fulong2e", mips_fulong2e_machine_init)
-- 
2.7.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
