Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C737598F
	for <lists.virtualization@lfdr.de>; Thu,  6 May 2021 19:42:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A9A402AF;
	Thu,  6 May 2021 17:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6W4QyloN0ALq; Thu,  6 May 2021 17:42:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595A3406A2;
	Thu,  6 May 2021 17:42:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D69EFC001C;
	Thu,  6 May 2021 17:42:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86A67C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 17:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79F6E406A2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 17:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7wI1G8gTm4m
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 17:42:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC7A6402AF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 17:42:20 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out02.mta.xmission.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1lei0n-005md5-4q; Thu, 06 May 2021 11:42:09 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=fess.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1lei0m-0003nZ-2F; Thu, 06 May 2021 11:42:08 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Joerg Roedel <joro@8bytes.org>
References: <20210506093122.28607-1-joro@8bytes.org>
 <20210506093122.28607-3-joro@8bytes.org>
Date: Thu, 06 May 2021 12:42:03 -0500
In-Reply-To: <20210506093122.28607-3-joro@8bytes.org> (Joerg Roedel's message
 of "Thu, 6 May 2021 11:31:22 +0200")
Message-ID: <m17dkb4v4k.fsf@fess.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1lei0m-0003nZ-2F; ; ; mid=<m17dkb4v4k.fsf@fess.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX18K6SvQ88nM/nPpaU9bp8QcNl7ZXSm1Ea8=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Virus: No
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Joerg Roedel <joro@8bytes.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 608 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 4.3 (0.7%), b_tie_ro: 2.8 (0.5%), parse: 1.46
 (0.2%), extract_message_metadata: 11 (1.9%), get_uri_detail_list: 1.16
 (0.2%), tests_pri_-1000: 6 (0.9%), tests_pri_-950: 1.07 (0.2%),
 tests_pri_-900: 0.84 (0.1%), tests_pri_-90: 182 (30.0%), check_bayes:
 168 (27.7%), b_tokenize: 7 (1.2%), b_tok_get_all: 26 (4.3%),
 b_comp_prob: 2.5 (0.4%), b_tok_touch_all: 130 (21.3%), b_finish: 0.82
 (0.1%), tests_pri_0: 246 (40.5%), check_dkim_signature: 0.37 (0.1%),
 check_dkim_adsp: 2.6 (0.4%), poll_dns_idle: 140 (23.0%), tests_pri_10:
 2.5 (0.4%), tests_pri_500: 148 (24.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 2/2] x86/kexec/64: Forbid kexec when running as an SEV-ES
 guest
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

Joerg Roedel <joro@8bytes.org> writes:

> From: Joerg Roedel <jroedel@suse.de>
>
> For now, kexec is not supported when running as an SEV-ES guest. Doing
> so requires additional hypervisor support and special code to hand
> over the CPUs to the new kernel in a safe way.
>
> Until this is implemented, do not support kexec in SEV-ES guests.

I don't understand this.

Fundamentally kexec is about doing things more or less inspite of
what the firmware is doing.

I don't have any idea what a SEV-ES is.  But the normal x86 boot doesn't
do anything special.  Is cross cpu IPI emulation buggy?

If this is a move in your face hypervisor like Xen is sometimes I can
see perhaps needing a little bit of different work during bootup.
Perhaps handing back a cpu on system shutdown and asking for more cpus
on system boot up.

What is the actual problem you are trying to avoid?

And yes for a temporary hack the suggestion of putting code into
machine_kexec_prepare seems much more reasonable so we don't have to
carry special case infrastructure for the forseeable future.

Eric


> Cc: stable@vger.kernel.org # v5.10+
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/machine_kexec_64.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
> index c078b0d3ab0e..f902cc9cc634 100644
> --- a/arch/x86/kernel/machine_kexec_64.c
> +++ b/arch/x86/kernel/machine_kexec_64.c
> @@ -620,3 +620,11 @@ void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages)
>  	 */
>  	set_memory_encrypted((unsigned long)vaddr, pages);
>  }
> +
> +/*
> + * Kexec is not supported in SEV-ES guests yet
> + */
> +bool arch_kexec_supported(void)
> +{
> +	return !sev_es_active();
> +}
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
