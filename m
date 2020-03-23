Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E2518FE44
	for <lists.virtualization@lfdr.de>; Mon, 23 Mar 2020 20:57:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 466E5860B2;
	Mon, 23 Mar 2020 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZeDASY8bApl; Mon, 23 Mar 2020 19:57:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E5B28623F;
	Mon, 23 Mar 2020 19:57:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B8BFC0177;
	Mon, 23 Mar 2020 19:57:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2411DC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB3486519
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvxROsQtBm-i
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7E701860B2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:43 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 23 Mar 2020 12:57:40 -0700
Received: from localhost.localdomain (unknown [10.118.101.94])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id AD9D5B23F5;
 Mon, 23 Mar 2020 15:57:41 -0400 (EDT)
To: <x86@kernel.org>
Subject: [PATCH v2 0/5] x86/vmware: Steal time accounting support
Date: Mon, 23 Mar 2020 19:57:02 +0000
Message-ID: <20200323195707.31242-1-amakhalov@vmware.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20200212200312.2033-1-amakhalov@vmware.com>
References: <20200212200312.2033-1-amakhalov@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: amakhalov@vmware.com does not
 designate permitted sender hosts)
Cc: Juergen Gross <jgross@suse.com>, Alexey Makhalov <amakhalov@vmware.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
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
From: Alexey Makhalov via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Alexey Makhalov <amakhalov@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi,

This is a second version of the series. Changes are mentioned bellow.
Big thanks for the reviewers.

v2 changes:
  - renamed steal_time to vmw_steal_time (3rd patch) to avoid
    conflict with KVM one to fix compilation issue found by
    Borislav Petkov and kbuild test robot <lkp@intel.com>
  - added: "Reviewed-by: Thomas Gleixner <tglx@linutronix.de>"

Best regards,
Alexey

Alexey Makhalov (5):
  x86/vmware: Make vmware_select_hypercall() __init
  x86/vmware: Remove vmware_sched_clock_setup()
  x86/vmware: Steal time clock for VMware guest
  x86/vmware: Enable steal time accounting
  x86/vmware: Use bool type for vmw_sched_clock

 Documentation/admin-guide/kernel-parameters.txt |   2 +-
 arch/x86/kernel/cpu/vmware.c                    | 229 +++++++++++++++++++++++-
 2 files changed, 222 insertions(+), 9 deletions(-)

-- 
2.14.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
