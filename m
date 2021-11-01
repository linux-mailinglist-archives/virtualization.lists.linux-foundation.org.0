Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E854344226B
	for <lists.virtualization@lfdr.de>; Mon,  1 Nov 2021 22:12:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E5F80C0B;
	Mon,  1 Nov 2021 21:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVa5riDyVnfG; Mon,  1 Nov 2021 21:12:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0888980C17;
	Mon,  1 Nov 2021 21:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EC63C0021;
	Mon,  1 Nov 2021 21:12:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F363C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 21:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 676B080C01
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 21:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5YTyYptuHoJa
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 21:12:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D803680C11
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 21:12:20 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:44908)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mhebJ-0082VH-1q; Mon, 01 Nov 2021 15:12:17 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:34474
 helo=email.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mhebH-002zh6-PG; Mon, 01 Nov 2021 15:12:16 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Borislav Petkov <bp@alien8.de>
References: <20210913155603.28383-1-joro@8bytes.org>
 <20210913155603.28383-2-joro@8bytes.org> <YYARccITlowHABg1@zn.tnic>
Date: Mon, 01 Nov 2021 16:11:42 -0500
In-Reply-To: <YYARccITlowHABg1@zn.tnic> (Borislav Petkov's message of "Mon, 1
 Nov 2021 17:10:25 +0100")
Message-ID: <87pmrjbmy9.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1mhebH-002zh6-PG; ; ; mid=<87pmrjbmy9.fsf@disp2133>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/dOcje8rMk6fFebgEu/saSTasGNFo4jXQ=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Borislav Petkov <bp@alien8.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 611 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 14 (2.3%), b_tie_ro: 12 (2.0%), parse: 0.91
 (0.1%), extract_message_metadata: 17 (2.8%), get_uri_detail_list: 1.38
 (0.2%), tests_pri_-1000: 11 (1.8%), tests_pri_-950: 1.41 (0.2%),
 tests_pri_-900: 1.43 (0.2%), tests_pri_-90: 131 (21.5%), check_bayes:
 112 (18.4%), b_tokenize: 8 (1.3%), b_tok_get_all: 8 (1.3%),
 b_comp_prob: 2.8 (0.5%), b_tok_touch_all: 88 (14.4%), b_finish: 1.62
 (0.3%), tests_pri_0: 416 (68.0%), check_dkim_signature: 0.64 (0.1%),
 check_dkim_adsp: 3.1 (0.5%), poll_dns_idle: 1.11 (0.2%), tests_pri_10:
 3.8 (0.6%), tests_pri_500: 11 (1.8%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 01/12] kexec: Allow architecture code to opt-out at
 runtime
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
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

Borislav Petkov <bp@alien8.de> writes:

> On Mon, Sep 13, 2021 at 05:55:52PM +0200, Joerg Roedel wrote:
>> From: Joerg Roedel <jroedel@suse.de>
>> 
>> Allow a runtime opt-out of kexec support for architecture code in case
>> the kernel is running in an environment where kexec is not properly
>> supported yet.
>> 
>> This will be used on x86 when the kernel is running as an SEV-ES
>> guest. SEV-ES guests need special handling for kexec to hand over all
>> CPUs to the new kernel. This requires special hypervisor support and
>> handling code in the guest which is not yet implemented.
>> 
>> Cc: stable@vger.kernel.org # v5.10+
>> Signed-off-by: Joerg Roedel <jroedel@suse.de>
>> ---
>>  include/linux/kexec.h |  1 +
>>  kernel/kexec.c        | 14 ++++++++++++++
>>  kernel/kexec_file.c   |  9 +++++++++
>>  3 files changed, 24 insertions(+)
>
> I guess I can take this through the tip tree along with the next one.

I seem to remember the consensus when this was reviewed that it was
unnecessary and there is already support for doing something like
this at a more fine grained level so we don't need a new kexec hook.

Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
