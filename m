Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AF15B1A9
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 21:18:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 403C587D05;
	Wed, 12 Feb 2020 20:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mheY7aaT2u+7; Wed, 12 Feb 2020 20:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F65987D86;
	Wed, 12 Feb 2020 20:18:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CDAEC0177;
	Wed, 12 Feb 2020 20:18:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F672C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2C14E86797
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N59fg37L4j9R
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B793D8442D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:50 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 12 Feb 2020 12:03:45 -0800
Received: from localhost.localdomain (unknown [10.118.101.94])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 91BAF4076A;
 Wed, 12 Feb 2020 12:03:47 -0800 (PST)
To: <x86@kernel.org>
Subject: [PATCH 0/5] x86/vmware: Steal time accounting support
Date: Wed, 12 Feb 2020 20:03:07 +0000
Message-ID: <20200212200312.2033-1-amakhalov@vmware.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: amakhalov@vmware.com does not
 designate permitted sender hosts)
Cc: Juergen Gross <jgross@suse.com>, Alexey Makhalov <amakhalov@vmware.com>,
 Jonathan Corbet <corbet@lwn.net>, "VMware, Inc." <pv-drivers@vmware.com>,
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

Hello,

This patchset introduces steal time accounting support for
the VMware guest. The idea and implementation of guest
steal time support is similar to KVM ones and it is based
on steal clock. The steal clock is a per CPU structure in
a shared memory between hypervisor and guest, initialized
by each CPU through hypercall. Steal clock is got updated
by the hypervisor and read by the guest. 

The patchset consists of 5 items:

1. x86/vmware: Make vmware_select_hypercall() __init
Minor clean up.

2. x86/vmware: Remove vmware_sched_clock_setup()
Preparation for the main patch.

3. x86/vmware: Steal time clock for VMware guest
Core steal time support functionality.

4. x86/vmware: Enable steal time accounting
Support for steal time accounting used by update_rq_clock().

5. x86/vmware: Use bool type for vmw_sched_clock
Minor clean up.

Alexey Makhalov (5):
  x86/vmware: Make vmware_select_hypercall() __init
  x86/vmware: Remove vmware_sched_clock_setup()
  x86/vmware: Steal time clock for VMware guest
  x86/vmware: Enable steal time accounting
  x86/vmware: Use bool type for vmw_sched_clock

 Documentation/admin-guide/kernel-parameters.txt |   2 +-
 arch/x86/kernel/cpu/vmware.c                    | 227 +++++++++++++++++++++++-
 2 files changed, 220 insertions(+), 9 deletions(-)

-- 
2.14.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
