Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EF445B01
	for <lists.virtualization@lfdr.de>; Thu,  4 Nov 2021 21:17:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 812A56063F;
	Thu,  4 Nov 2021 20:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKFZ1Qkf8UXG; Thu,  4 Nov 2021 20:17:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7969960876;
	Thu,  4 Nov 2021 20:17:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DB83C0021;
	Thu,  4 Nov 2021 20:17:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FB2BC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ABC3401FC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vk9tKKh90o_G
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:17:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79228401E7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 20:17:27 +0000 (UTC)
Received: from c-24-16-8-193.hsd1.wa.comcast.net ([24.16.8.193]
 helo=srivatsab-a02.vmware.com)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1mijAh-000PTG-GF; Thu, 04 Nov 2021 16:17:15 -0400
Subject: Re: Which tree for paravirt related patches?
To: Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 X86 ML <x86@kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
References: <60a2037d-2d4d-e9e9-edfd-b889c4bd3fb6@suse.com>
 <874k8s5lgz.ffs@tglx> <87zgqk46u7.ffs@tglx>
 <b4288d2d-8300-6d1f-f4d1-8d922f46fb70@csail.mit.edu> <87o86z4r5k.ffs@tglx>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <b9a8899f-347b-4bde-b1b4-0eba36b21a40@csail.mit.edu>
Date: Thu, 4 Nov 2021 13:17:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87o86z4r5k.ffs@tglx>
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

Hi Thomas,

On 11/4/21 1:11 PM, Thomas Gleixner wrote:
> Srivatsa,
> 
> On Thu, Nov 04 2021 at 12:09, Srivatsa S. Bhat wrote:
>> On a related note, I'll be stepping in soon to assist (in place of
>> Deep) as a co-maintainer of the PARAVIRT_OPS interface. I had the same
>> query about which tree would be best for patches to the paravirt-ops
>> code, so I'm glad to see that it got clarified on this thread.
> 
> Welcome to the club.
> 

Thank you! :-)

>> I'll also be taking over the maintainership of the VMware hypervisor
>> interface. Looking at the git logs, I believe those patches have
>> also been handled via the tip tree; so would it be okay to add the
>> x86 ML and the tip tree to the VMware hypervisor interface entry too
>> in the MAINTAINERS file?
> 
> We've routed them through tip, yes. So yes, that's fine to have a
> separate entry in the maintainers file which has you and x86@kernel.org
> plus the tip tree mentioned.
> 
Awesome, thanks a lot!

Regards,
Srivatsa
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
