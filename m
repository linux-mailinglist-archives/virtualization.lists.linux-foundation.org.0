Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C786375B13
	for <lists.virtualization@lfdr.de>; Thu,  6 May 2021 21:00:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D8440566;
	Thu,  6 May 2021 19:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsxLk0Yt-ex5; Thu,  6 May 2021 19:00:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3281B40653;
	Thu,  6 May 2021 19:00:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A29E6C0001;
	Thu,  6 May 2021 19:00:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 289AAC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13CE8615D8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i60T0jQK70-2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:59:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33D01615D0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:59:57 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1lejDx-006IlB-FL; Thu, 06 May 2021 12:59:49 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=fess.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1lejDv-007wor-20; Thu, 06 May 2021 12:59:48 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Joerg Roedel <jroedel@suse.de>
References: <20210506093122.28607-1-joro@8bytes.org>
 <20210506093122.28607-3-joro@8bytes.org>
 <m17dkb4v4k.fsf@fess.ebiederm.org> <YJQ4QTtvG76WpcNf@suse.de>
Date: Thu, 06 May 2021 13:59:42 -0500
In-Reply-To: <YJQ4QTtvG76WpcNf@suse.de> (Joerg Roedel's message of "Thu, 6 May
 2021 20:41:05 +0200")
Message-ID: <m1o8dn1ye9.fsf@fess.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1lejDv-007wor-20; ; ; mid=<m1o8dn1ye9.fsf@fess.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+QSetsVGHHRPIqFsnfIS69iprRKQZBDtk=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Joerg Roedel <jroedel@suse.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1515 ms - load_scoreonly_sql: 0.07 (0.0%),
 signal_user_changed: 11 (0.7%), b_tie_ro: 10 (0.6%), parse: 0.96
 (0.1%), extract_message_metadata: 13 (0.9%), get_uri_detail_list: 1.98
 (0.1%), tests_pri_-1000: 6 (0.4%), tests_pri_-950: 1.32 (0.1%),
 tests_pri_-900: 1.14 (0.1%), tests_pri_-90: 132 (8.7%), check_bayes:
 122 (8.1%), b_tokenize: 10 (0.7%), b_tok_get_all: 10 (0.7%),
 b_comp_prob: 3.3 (0.2%), b_tok_touch_all: 95 (6.2%), b_finish: 0.98
 (0.1%), tests_pri_0: 1335 (88.1%), check_dkim_signature: 0.59 (0.0%),
 check_dkim_adsp: 2.4 (0.2%), poll_dns_idle: 0.57 (0.0%), tests_pri_10:
 3.1 (0.2%), tests_pri_500: 8 (0.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 2/2] x86/kexec/64: Forbid kexec when running as an SEV-ES
 guest
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
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

Joerg Roedel <jroedel@suse.de> writes:

> On Thu, May 06, 2021 at 12:42:03PM -0500, Eric W. Biederman wrote:
>> I don't understand this.
>> 
>> Fundamentally kexec is about doing things more or less inspite of
>> what the firmware is doing.
>> 
>> I don't have any idea what a SEV-ES is.  But the normal x86 boot doesn't
>> do anything special.  Is cross cpu IPI emulation buggy?
>
> Under SEV-ES the normal SIPI-based sequence to re-initialize a CPU does
> not work anymore. An SEV-ES guest is a special virtual machine where the
> hardware encrypts the guest memory and the guest register state. The
> hypervisor can't make any modifications to the guests registers at
> runtime. Therefore it also can't emulate a SIPI sequence and reset the
> vCPU.
>
> The guest kernel has to reset the vCPU itself and hand it over from the
> old kernel to the kexec'ed kernel. This isn't currently implemented and
> therefore kexec needs to be disabled when running as an SEV-ES guest.
>
> Implementing this also requires an extension to the guest-hypervisor
> protocol (the GHCB Spec[1]) which is only available in version 2. So a
> guest running on a hypervisor supporting only version 1 will never
> properly support kexec.

Why does it need that?

Would it not make sense to instead teach kexec how to pass a cpu from
one kernel to another.  We could use that everywhere.

Even the kexec-on-panic case should work as even in that case we have
to touch the cpus as they go down.

The hardware simply worked well enough that it hasn't mattered enough
for us to do something like that, but given that we need to do something
anyway.  It seems like it would make most sense do something that
will work everywhere, and does not introduce unnecessary dependencies
on hypervisors.

>> What is the actual problem you are trying to avoid?
>
> Currently, if someone tries kexec in an SEV-ES guest, the kexec'ed
> kernel will only be able to bring up the boot CPU, not the others. The
> others will wake up with the old kernels CPU state in the new kernels
> memory and do undefined things, most likely triple-fault because their
> page-table is not existent anymore.
>
> So since kexec currently does not work as expected under SEV-ES, it is
> better to hide it until everything is implemented so it can do what the
> user expects.

I can understand temporarily disabling the functionality.

>> And yes for a temporary hack the suggestion of putting code into
>> machine_kexec_prepare seems much more reasonable so we don't have to
>> carry special case infrastructure for the forseeable future.
>
> As I said above, for protocol version 1 it will stay disabled, so it is
> not only a temporary hack.

Why does bringing up a cpu need hypervisor support?

I understand why we can't do what we do currently, but that doesn't seem
to preclude doing something without hypervisor support.

Eric
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
