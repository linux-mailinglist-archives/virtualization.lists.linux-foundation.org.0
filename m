Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD0B375A44
	for <lists.virtualization@lfdr.de>; Thu,  6 May 2021 20:41:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95DD160E1B;
	Thu,  6 May 2021 18:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLOmiNO_FLiy; Thu,  6 May 2021 18:41:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC67615CD;
	Thu,  6 May 2021 18:41:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD2E3C0001;
	Thu,  6 May 2021 18:41:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64DBDC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4654F615D1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4JxKJt-5O2P
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EFE361593
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:41:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E651B186;
 Thu,  6 May 2021 18:41:08 +0000 (UTC)
Date: Thu, 6 May 2021 20:41:05 +0200
From: Joerg Roedel <jroedel@suse.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 2/2] x86/kexec/64: Forbid kexec when running as an SEV-ES
 guest
Message-ID: <YJQ4QTtvG76WpcNf@suse.de>
References: <20210506093122.28607-1-joro@8bytes.org>
 <20210506093122.28607-3-joro@8bytes.org>
 <m17dkb4v4k.fsf@fess.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m17dkb4v4k.fsf@fess.ebiederm.org>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Kees Cook <keescook@chromium.org>,
 Cfir Cohen <cfir@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Thu, May 06, 2021 at 12:42:03PM -0500, Eric W. Biederman wrote:
> I don't understand this.
> 
> Fundamentally kexec is about doing things more or less inspite of
> what the firmware is doing.
> 
> I don't have any idea what a SEV-ES is.  But the normal x86 boot doesn't
> do anything special.  Is cross cpu IPI emulation buggy?

Under SEV-ES the normal SIPI-based sequence to re-initialize a CPU does
not work anymore. An SEV-ES guest is a special virtual machine where the
hardware encrypts the guest memory and the guest register state. The
hypervisor can't make any modifications to the guests registers at
runtime. Therefore it also can't emulate a SIPI sequence and reset the
vCPU.

The guest kernel has to reset the vCPU itself and hand it over from the
old kernel to the kexec'ed kernel. This isn't currently implemented and
therefore kexec needs to be disabled when running as an SEV-ES guest.

Implementing this also requires an extension to the guest-hypervisor
protocol (the GHCB Spec[1]) which is only available in version 2. So a
guest running on a hypervisor supporting only version 1 will never
properly support kexec.

> What is the actual problem you are trying to avoid?

Currently, if someone tries kexec in an SEV-ES guest, the kexec'ed
kernel will only be able to bring up the boot CPU, not the others. The
others will wake up with the old kernels CPU state in the new kernels
memory and do undefined things, most likely triple-fault because their
page-table is not existent anymore.

So since kexec currently does not work as expected under SEV-ES, it is
better to hide it until everything is implemented so it can do what the
user expects.

> And yes for a temporary hack the suggestion of putting code into
> machine_kexec_prepare seems much more reasonable so we don't have to
> carry special case infrastructure for the forseeable future.

As I said above, for protocol version 1 it will stay disabled, so it is
not only a temporary hack.

Regards,

	Joerg

[1] https://developer.amd.com/wp-content/resources/56421.pdf

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
