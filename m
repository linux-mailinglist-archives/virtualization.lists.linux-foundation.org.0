Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 325AE445A9D
	for <lists.virtualization@lfdr.de>; Thu,  4 Nov 2021 20:31:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0BC860876;
	Thu,  4 Nov 2021 19:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVzldge1PZ7C; Thu,  4 Nov 2021 19:31:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AA533606F9;
	Thu,  4 Nov 2021 19:31:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31763C0021;
	Thu,  4 Nov 2021 19:31:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD84CC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 19:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA90E40018
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 19:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZGTwNfDjq98
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 19:31:04 +0000 (UTC)
X-Greylist: delayed 00:21:40 by SQLgrey-1.8.0
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61D6940015
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 19:31:04 +0000 (UTC)
Received: from c-24-16-8-193.hsd1.wa.comcast.net ([24.16.8.193]
 helo=srivatsab-a02.vmware.com)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1mii6k-000L1z-Lw; Thu, 04 Nov 2021 15:09:06 -0400
To: Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 X86 ML <x86@kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
References: <60a2037d-2d4d-e9e9-edfd-b889c4bd3fb6@suse.com>
 <874k8s5lgz.ffs@tglx> <87zgqk46u7.ffs@tglx>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: Which tree for paravirt related patches?
Message-ID: <b4288d2d-8300-6d1f-f4d1-8d922f46fb70@csail.mit.edu>
Date: Thu, 4 Nov 2021 12:09:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87zgqk46u7.ffs@tglx>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Pv-drivers <Pv-drivers@vmware.com>,
 IngoMolnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jan Beulich <JBeulich@suse.com>, amakhalov@vmware.com
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

Hi Juergen, Thomas,

On 11/4/21 2:18 AM, Thomas Gleixner wrote:
> On Thu, Nov 04 2021 at 10:17, Thomas Gleixner wrote:
> 
> CC+ x86, peterz
> 
>> Juergen,
>>
>> On Thu, Nov 04 2021 at 06:53, Juergen Gross wrote:
>>
>>> A recent patch modifying the core paravirt-ops functionality is
>>> highlighting some missing MAINTAINERS information for PARAVIRT_OPS:
>>> there is no information which tree is to be used for taking those
>>> patches per default. In the past this was mostly handled by the tip
>>> tree, and I think this is fine.
>>>
>>> X86 maintainers, are you fine with me modifying the PARAVIRT_OPS entry
>>> to add the x86 ML and the tip tree? This way such patches will be
>>> noticed by you and can be handled accordingly.
>>
>> Sure.
>>

On a related note, I'll be stepping in soon to assist (in place of
Deep) as a co-maintainer of the PARAVIRT_OPS interface. I had the same
query about which tree would be best for patches to the paravirt-ops
code, so I'm glad to see that it got clarified on this thread.

I'll also be taking over the maintainership of the VMware hypervisor
interface. Looking at the git logs, I believe those patches have
also been handled via the tip tree; so would it be okay to add the
x86 ML and the tip tree to the VMware hypervisor interface entry too
in the MAINTAINERS file?

Thank you very much!

Regards,
Srivatsa
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
