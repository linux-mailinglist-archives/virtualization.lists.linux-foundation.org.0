Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DBD21AFF2
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 09:18:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 90E48898B3;
	Fri, 10 Jul 2020 07:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWktRgWOtwYf; Fri, 10 Jul 2020 07:18:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD85E89806;
	Fri, 10 Jul 2020 07:18:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE67DC08A9;
	Fri, 10 Jul 2020 07:18:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0956DC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DF65C20524
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ow7VxS6UGnM7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:18:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id C203A2051B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594365487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGoPGTEznFk5h14aCUBaJwrGf/5Nb40zpROvBbNiTpA=;
 b=EP60IbkZ8RsasnJp8wui+wFake4Ai1zn0hRUOAgQ8AoWBVjWRey9+udl3KNYIuaZGflpVd
 sokWs+goDX0EN/WnxD7+uKCZiPeaMwSgxurFaEpJ+M13IDkxWso3ZVNEvCWTIuzG420HRJ
 r1ZNjT1XTTf2CSS3KwyjOBovG3z9uCU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-bD5SWO5nOH-LZOc7RqGblg-1; Fri, 10 Jul 2020 03:18:02 -0400
X-MC-Unique: bD5SWO5nOH-LZOc7RqGblg-1
Received: by mail-wm1-f70.google.com with SMTP id l5so5558341wml.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 00:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FGoPGTEznFk5h14aCUBaJwrGf/5Nb40zpROvBbNiTpA=;
 b=c/9nglXiSretNx6Y+X8wXGA6/BfaOvcHPs2UlDEWD1TVkHJ2MRJLsJzUyNspfdrJ5H
 FO0g8wfZ886lGAUgirY09l4sadV1bfIEHJLYbgt6qZLZzkuohY7VJXLAT2g5d+4COr6D
 QPbJiV+F2FPv+0KK+3Jlm16Dmx3tSgw52jzc/oe4fE2YeC+UxGGYkOpHXQuheyuwHvhq
 Nx/zauelPzFXER64Utt/Kvilb0dabVOompxnimNikM/7GLTFj4sqfFJxokZQBKJgkAHF
 J4hDGHO2y5MjnFs9NJt4aMCDR3YSQJBgQaiYFAbB1ZoSFcdQ08S7Um/TKPZ9NwWx1fU/
 uU2g==
X-Gm-Message-State: AOAM531PiRUrlrt3bOI/BD4k/BgDEyYajnUsdWEj9881KpVgiWg2S0Li
 IEYIxGBEoZXVVPXFAY0oQ1YCvANI7dmllpKKyYoguJBbpAkoK3PRMifRwGu8NUBDOYgYcfCjyM9
 Ce3LL2TOv78BY9EF3VNdqvhkgn7OWmfpx+eyv0hqnEg==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr27335911wrx.356.1594365481347; 
 Fri, 10 Jul 2020 00:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8Rr8IAsbJamgn8rqldry9PUjrzvHl5OLB3NeoeT73v1oK2Um8w8bXswITBBP+sRvLWq5k6w==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr27335889wrx.356.1594365481075; 
 Fri, 10 Jul 2020 00:18:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id w14sm8969677wrt.55.2020.07.10.00.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 00:18:00 -0700 (PDT)
Subject: Re: [PATCH] scsi: virtio_scsi: Remove unnecessary condition checks
To: Markus Elfring <Markus.Elfring@web.de>,
 Xianting Tian <xianting_tian@126.com>, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
 <e87746e6-813e-7c0e-e21e-5921e759da5d@redhat.com>
 <8eb9a827-45f1-e71c-0cbf-1c29acd8e310@web.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <58e3feb8-1ffb-f77f-cf3a-75222b3cd524@redhat.com>
Date: Fri, 10 Jul 2020 09:17:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8eb9a827-45f1-e71c-0cbf-1c29acd8e310@web.de>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "James E. J. Bottomley" <jejb@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMTAvMDcvMjAgMDg6MzIsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+Pj4+ICsJbWVtcG9vbF9k
ZXN0cm95KHZpcnRzY3NpX2NtZF9wb29sKTsKPj4+PiArCXZpcnRzY3NpX2NtZF9wb29sID0gTlVM
TDsKPj4+PiArCWttZW1fY2FjaGVfZGVzdHJveSh2aXJ0c2NzaV9jbWRfY2FjaGUpOwo+Pj4+ICsJ
dmlydHNjc2lfY21kX2NhY2hlID0gTlVMTDsKPj4+PiAgCXJldHVybiByZXQ7Cj4+Pj4gIH0KPj4+
Cj4+PiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGFkZCBhIGp1bXAgdGFyZ2V0IHNvIHRoYXQg
dGhlIGV4ZWN1dGlvbgo+Pj4gb2YgYSBmZXcgc3RhdGVtZW50cyBjYW4gYmUgYXZvaWRlZCBhY2Nv
cmRpbmcgdG8gYSBwcmV2aW91cwo+Pj4gbnVsbCBwb2ludGVyIGNoZWNrPwo+Pgo+PiBUaGUgcG9p
bnQgb2YgdGhlIHBhdGNoIGlzIHByZWNpc2VseSB0byBzaW1wbGlmeSB0aGUgY29kZSwKPiAKPiBJ
IHN1Z2dlc3QgdG8gcmVjb25zaWRlciBhbHNvIExpbnV4IGNvZGluZyBzdHlsZSBhc3BlY3RzCj4g
Zm9yIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24g4oCcaW5pdOKAnS4KPiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS44LXJjNC9zb3VyY2UvZHJpdmVycy9zY3Np
L3ZpcnRpb19zY3NpLmMjTDk4MAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc2NzaS92aXJ0aW9f
c2NzaS5jP2lkPTQyZjgyMDQwZWU2NmRiMTM1MjVkYzZmMTRiODU1OTg5MGIyZjRjMWMjbjk4MAo+
IAo+ICAJaWYgKCF2aXJ0c2NzaV9jbWRfY2FjaGUpIHsKPiAgCQlwcl9lcnIoImttZW1fY2FjaGVf
Y3JlYXRlKCkgZm9yIHZpcnRzY3NpX2NtZF9jYWNoZSBmYWlsZWRcbiIpOwo+IC0JCWdvdG8gZXJy
b3I7Cj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gCX0KCkNvdWxkIGJlIGRvYWJsZSwgYnV0IEkgZG9u
J3Qgc2VlIGEgcGFydGljdWxhciBiZW5lZml0LiAgSGF2aW5nIGEgc2luZ2xlCmVycm9yIGxvb3Ag
aXMgYW4gYWR2YW50YWdlIGJ5IGl0c2VsZi4KClRoZSBjb2Rpbmcgc3R5bGUgaXMgYSBzdWdnZXN0
aW9uLiAgTm90ZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuCgoJCWtmcmVlKGZvby0+YmFyKTsKCQlr
ZnJlZShmb28pOwoKYW5kCgoJCWtmcmVlKGJhcik7CgkJa2ZyZWUoZm9vKTsKCj4gU2VlIGFsc286
Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3Q/
aWQ9NDJmODIwNDBlZTY2ZGIxMzUyNWRjNmYxNGI4NTU5ODkwYjJmNGMxYyNuNDYxCj4gCj4gCj4+
IGV4ZWN1dGluZyBhIGNvdXBsZSBtb3JlIGluc3RydWN0aW9uIGlzIG5vdCBhbiBpc3N1ZS4KPiAK
PiBXaXRoIHdoaWNoIHVwZGF0ZSBzdGVwcyB3b3VsZCBsaWtlIHRvIGFjaGlldmUgc3VjaCBhIGNv
ZGUgdmFyaWFudD8KPiAKPiBkZXN0cm95X3Bvb2w6Cj4gCW1lbXBvb2xfZGVzdHJveSh2aXJ0c2Nz
aV9jbWRfcG9vbCk7Cj4gCXZpcnRzY3NpX2NtZF9wb29sID0gTlVMTDsKPiBkZXN0cm95X2NhY2hl
Ogo+IAlrbWVtX2NhY2hlX2Rlc3Ryb3kodmlydHNjc2lfY21kX2NhY2hlKTsKPiAJdmlydHNjc2lf
Y21kX2NhY2hlID0gTlVMTDsKPiAJcmV0dXJuIHJldDsKCi4uLiB3aGlsZSB0aGVyZSdzIG5vIGFk
dmFudGFnZSBpbiB0aGlzLgoKUGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
