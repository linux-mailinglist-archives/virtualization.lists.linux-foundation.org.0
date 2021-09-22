Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DE35E414639
	for <lists.virtualization@lfdr.de>; Wed, 22 Sep 2021 12:31:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC67613BD;
	Wed, 22 Sep 2021 10:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PBBrHUfYzIO; Wed, 22 Sep 2021 10:31:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B5666613D2;
	Wed, 22 Sep 2021 10:31:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1F4CC0025;
	Wed, 22 Sep 2021 10:31:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFE8AC0011
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 10:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FD07404D0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 10:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RO2gdkWmMKf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 10:31:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46259407BC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 10:31:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FD44201DD;
 Wed, 22 Sep 2021 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1632306667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=s1H6Hgf+92X5PDjWMvrW0ZAWQ57zgmauDgvkDjzNQEw=;
 b=YYfv4ClZEZvhsiD2N/MbxWAvzX1c20MHJQVGK2jzgdzcUQ4rvnnCJ+VZbLjoNGliQ1Hb30
 8ZdrIT9YZ1uZE6muO7O2brCrMzr8OTocfoMsuQATPSy1psgRUzeaRVcsEAIGE6FyRDvKMv
 2q13TFoSLgeO1fYkP0yDUOsUSWy/oFI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD9CA13D69;
 Wed, 22 Sep 2021 10:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id D6lWJ+oFS2GHWAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Sep 2021 10:31:06 +0000
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/2] x86/xen: simplify irq pvops
Date: Wed, 22 Sep 2021 12:31:00 +0200
Message-Id: <20210922103102.3589-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, peterz@infradead.org, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
From: Juergen Gross via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The pvops function for Xen PV guests handling the interrupt flag are
much more complex than needed.

With the supported Xen hypervisor versions they can be simplified a
lot, especially by removing the need for disabling preemption.

Juergen Gross (2):
  x86/xen: remove xen_have_vcpu_info_placement flag
  x86/xen: switch initial pvops IRQ functions to dummy ones

 arch/x86/include/asm/paravirt_types.h |   2 +
 arch/x86/kernel/paravirt.c            |  13 ++-
 arch/x86/xen/enlighten.c              | 116 ++++++--------------------
 arch/x86/xen/enlighten_hvm.c          |   6 +-
 arch/x86/xen/enlighten_pv.c           |  28 ++-----
 arch/x86/xen/irq.c                    |  61 +-------------
 arch/x86/xen/smp.c                    |  24 ------
 arch/x86/xen/xen-ops.h                |   4 +-
 8 files changed, 53 insertions(+), 201 deletions(-)

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
