Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F93163CB1
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 06:35:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B47887807;
	Wed, 19 Feb 2020 05:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uCexvMWkbCF; Wed, 19 Feb 2020 05:35:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49C7187872;
	Wed, 19 Feb 2020 05:35:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10E9DC1D89;
	Wed, 19 Feb 2020 05:35:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBAFAC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C276B87872
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TzmqGzblKyZb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:35:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 750EE87807
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:35:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4DC33AE24;
 Wed, 19 Feb 2020 05:35:17 +0000 (UTC)
Subject: Re: [PATCH] x86/ioperm: add new paravirt function update_io_bitmap
To: Thomas Gleixner <tglx@linutronix.de>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
Date: Wed, 19 Feb 2020 06:35:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, stable@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 18.02.20 22:03, Thomas Gleixner wrote:
> Juergen Gross <jgross@suse.com> writes:
>> Commit 111e7b15cf10f6 ("x86/ioperm: Extend IOPL config to control
>> ioperm() as well") reworked the iopl syscall to use I/O bitmaps.
>>
>> Unfortunately this broke Xen PV domains using that syscall as there
>> is currently no I/O bitmap support in PV domains.
>>
>> Add I/O bitmap support via a new paravirt function update_io_bitmap
>> which Xen PV domains can use to update their I/O bitmaps via a
>> hypercall.
>>
>> Fixes: 111e7b15cf10f6 ("x86/ioperm: Extend IOPL config to control ioperm() as well")
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Cc: <stable@vger.kernel.org> # 5.5
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Jan Beulich <jbeulich@suse.com>
> 
> Duh, sorry about that and thanks for fixing it.
> 
> BTW, why isn't stuff like this not catched during next or at least
> before the final release? Is nothing running CI on upstream with all
> that XEN muck active?

This problem showed up by not being able to start the X server (probably
not the freshest one) in dom0 on a moderate aged AMD system.

Our CI tests tend do be more text console based for dom0.


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
