Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C721640BF
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 10:46:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC59C86739;
	Wed, 19 Feb 2020 09:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M+JuP-AD4mPm; Wed, 19 Feb 2020 09:46:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D0C186746;
	Wed, 19 Feb 2020 09:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73F66C1D87;
	Wed, 19 Feb 2020 09:46:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D7CAC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D6F0820357
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UiI0fNnXxPre
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:46:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id BA2992049A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 09:46:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 594C6AC22;
 Wed, 19 Feb 2020 09:46:17 +0000 (UTC)
Subject: Re: [PATCH] x86/ioperm: add new paravirt function update_io_bitmap
To: Thomas Gleixner <tglx@linutronix.de>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
 <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
 <8736b7q6ca.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4537af8d-e28f-1c27-53a9-e3208874037e@suse.com>
Date: Wed, 19 Feb 2020 10:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8736b7q6ca.fsf@nanos.tec.linutronix.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMTkuMDIuMjAgMTA6MjIsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBKw7xyZ2VuIEdyb8Of
IDxqZ3Jvc3NAc3VzZS5jb20+IHdyaXRlczoKPj4gT24gMTguMDIuMjAgMjI6MDMsIFRob21hcyBH
bGVpeG5lciB3cm90ZToKPj4+IEJUVywgd2h5IGlzbid0IHN0dWZmIGxpa2UgdGhpcyBub3QgY2F0
Y2hlZCBkdXJpbmcgbmV4dCBvciBhdCBsZWFzdAo+Pj4gYmVmb3JlIHRoZSBmaW5hbCByZWxlYXNl
PyBJcyBub3RoaW5nIHJ1bm5pbmcgQ0kgb24gdXBzdHJlYW0gd2l0aCBhbGwKPj4+IHRoYXQgWEVO
IG11Y2sgYWN0aXZlPwo+Pgo+PiBUaGlzIHByb2JsZW0gc2hvd2VkIHVwIGJ5IG5vdCBiZWluZyBh
YmxlIHRvIHN0YXJ0IHRoZSBYIHNlcnZlciAocHJvYmFibHkKPj4gbm90IHRoZSBmcmVzaGVzdCBv
bmUpIGluIGRvbTAgb24gYSBtb2RlcmF0ZSBhZ2VkIEFNRCBzeXN0ZW0uCj4+Cj4+IE91ciBDSSB0
ZXN0cyB0ZW5kIGRvIGJlIG1vcmUgdGV4dCBjb25zb2xlIGJhc2VkIGZvciBkb20wLgo+IAo+IHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9pb1twZXJtfHBsXSBzaG91bGQgaGF2ZSBjYXVnaHQg
dGhhdCBhcyB3ZWxsLAo+IHJpZ2h0PyBJZiBub3QsIHdlIG5lZWQgdG8gZml4IHRoZSBzZWxmdGVz
dHMuCgpIbW0sIHllcy4gVGhhbmtzIGZvciB0aGUgcG9pbnRlci4KCldpbGwgYXNrIG91ciB0ZXN0
aW5nIHNwZWNpYWxpc3Qgd2hhdCBpcyBkb25lIGluIHRoaXMgcmVnYXJkIGFuZCBob3cgaXQKY2Fu
IGJlIGVuaGFuY2VkLgoKCkp1ZXJnZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
