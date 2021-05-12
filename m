Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99F37B763
	for <lists.virtualization@lfdr.de>; Wed, 12 May 2021 10:04:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3756F82FAE;
	Wed, 12 May 2021 08:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwjVuW-bkap7; Wed, 12 May 2021 08:04:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F4FB83005;
	Wed, 12 May 2021 08:04:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D7E6C0001;
	Wed, 12 May 2021 08:04:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 545CAC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 08:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34F184027E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 08:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMt8OyHy41Fl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 08:04:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D645D40015
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 08:04:39 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-226-GJ3a8MFKOOuK1O-e4s34MQ-1; Wed, 12 May 2021 09:04:35 +0100
X-MC-Unique: GJ3a8MFKOOuK1O-e4s34MQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 12 May 2021 09:04:33 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Wed, 12 May 2021 09:04:33 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joerg Roedel' <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>,
 Hyunwook Baek <baekhw@google.com>
Subject: RE: [PATCH 3/6] x86/sev-es: Use __put_user()/__get_user
Thread-Topic: [PATCH 3/6] x86/sev-es: Use __put_user()/__get_user
Thread-Index: AQHXRwQswpicLJM6a0eoGXhfP+3kQqrfe29g
Date: Wed, 12 May 2021 08:04:33 +0000
Message-ID: <0496626f018d4d27a8034a4822170222@AcuMS.aculab.com>
References: <20210512075445.18935-1-joro@8bytes.org>
 <20210512075445.18935-4-joro@8bytes.org>
In-Reply-To: <20210512075445.18935-4-joro@8bytes.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, "hpa@zytor.com" <hpa@zytor.com>,
 Jiri Slaby <jslaby@suse.cz>, David Rientjes <rientjes@google.com>,
 Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
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

From: Joerg
> Sent: 12 May 2021 08:55
> 
> From: Joerg Roedel <jroedel@suse.de>
> 
> The put_user() and get_user() functions do checks on the address which is
> passed to them. They check whether the address is actually a user-space
> address and whether its fine to access it. They also call might_fault()
> to indicate that they could fault and possibly sleep.
> 
> All of these checks are neither wanted nor required in the #VC exception
> handler, which can be invoked from almost any context and also for MMIO
> instructions from kernel space on kernel memory. All the #VC handler
> wants to know is whether a fault happened when the access was tried.
> 
> This is provided by __put_user()/__get_user(), which just do the access
> no matter what.

That can't be right at all.
__put/get_user() are only valid on user addresses and will try to
fault in a missing page - so can sleep.

At best this is abused the calls.

	David

> Fixes: f980f9c31a92 ("x86/sev-es: Compile early handler code into kernel image")
> Cc: stable@vger.kernel.org # v5.10+
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 6530a844eb61..110b39345b40 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -342,22 +342,22 @@ static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
>  	switch (size) {
>  	case 1:
>  		memcpy(&d1, buf, 1);
> -		if (put_user(d1, target))
> +		if (__put_user(d1, target))
>  			goto fault;
>  		break;
>  	case 2:
>  		memcpy(&d2, buf, 2);
> -		if (put_user(d2, target))
> +		if (__put_user(d2, target))
>  			goto fault;
>  		break;
>  	case 4:
>  		memcpy(&d4, buf, 4);
> -		if (put_user(d4, target))
> +		if (__put_user(d4, target))
>  			goto fault;
>  		break;
>  	case 8:
>  		memcpy(&d8, buf, 8);
> -		if (put_user(d8, target))
> +		if (__put_user(d8, target))
>  			goto fault;
>  		break;
>  	default:
> @@ -396,22 +396,22 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
> 
>  	switch (size) {
>  	case 1:
> -		if (get_user(d1, s))
> +		if (__get_user(d1, s))
>  			goto fault;
>  		memcpy(buf, &d1, 1);
>  		break;
>  	case 2:
> -		if (get_user(d2, s))
> +		if (__get_user(d2, s))
>  			goto fault;
>  		memcpy(buf, &d2, 2);
>  		break;
>  	case 4:
> -		if (get_user(d4, s))
> +		if (__get_user(d4, s))
>  			goto fault;
>  		memcpy(buf, &d4, 4);
>  		break;
>  	case 8:
> -		if (get_user(d8, s))
> +		if (__get_user(d8, s))
>  			goto fault;
>  		memcpy(buf, &d8, 8);
>  		break;
> --
> 2.31.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
