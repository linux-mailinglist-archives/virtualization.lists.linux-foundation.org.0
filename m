Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CBE30A53A
	for <lists.virtualization@lfdr.de>; Mon,  1 Feb 2021 11:21:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1118B8697B;
	Mon,  1 Feb 2021 10:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXu1Or3nI+7z; Mon,  1 Feb 2021 10:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F35EF86962;
	Mon,  1 Feb 2021 10:21:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D05A9C013A;
	Mon,  1 Feb 2021 10:21:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16243C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 10:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F028C8623E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 10:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhvPBfRPLeni
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 10:21:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4A5D786211
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612174887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76s0xuNfIMYw2Zjhat6XiJ6WTlVIEyZzd1HMUW58qTQ=;
 b=NtnVkOQliybHu9XtGlXIh6G3JY5vwoc2M7l0wWYYRKsY9QSvpzHdmZKKeh/RgRSUseLEj9
 uPhIaYfsXb3WyiAlq6Tl879QHo2huScwxmuiW7QDqyfWH79W5WJlSwrBgYHU8CbXSkmd9d
 Ed1gKSPqiITaPgdPBd1h3AvRgpGhelM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-6IsEck5oPPe-NNXxtrM4rQ-1; Mon, 01 Feb 2021 05:21:25 -0500
X-MC-Unique: 6IsEck5oPPe-NNXxtrM4rQ-1
Received: by mail-wm1-f71.google.com with SMTP id f6so236028wmj.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 01 Feb 2021 02:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=76s0xuNfIMYw2Zjhat6XiJ6WTlVIEyZzd1HMUW58qTQ=;
 b=nHuyo+Lp06lcnu+jQIkTUp7WzYvEq1UzBjC5lYh1/8beCkZE7k76J9osDy6IzR2eLM
 WL0Fck4RmNujLTrianWcAj+AGN5JM1p7CMH8MYzNgXyv5ejm4m4cF+KTKC34oV6+K9/1
 QyDo95eAMkyOF3r2ejvX0jnRzKArSvTNoYghYlg/FmxHSHJoSt+sdSRTw18oW4+5rtfq
 z9fZKk0grgCNeB2018RqdGlNf91hyR+a9XuK1S7PftE/HpKGo3H7mqj0ygcbpzQLWuRF
 JvUjESp/cvxy1ij5jKgXZZiirc2ycW6Pexo2IsBaoH4GBNTiyk0MwNFeFnuzTfSF5bQZ
 hCBw==
X-Gm-Message-State: AOAM532yTBNaCokr61+WEOVeSTfl04TiTyxC9K3izUZxV/BSHNekQPoS
 sNQ1kefb1+VOFhf7ruAjyKEe+t+RJd1iNWCqv/cEjOUBMMf9cJcqkd5LoM6E2exTdeagv03q1bw
 vRqYoiA3azlfM4C18Ss6oreqAAnil3T3lcmgdrmeYRA==
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr14042900wmc.158.1612174884000; 
 Mon, 01 Feb 2021 02:21:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLJ3fELTf0uO9C4XANpCrWi3BAnIjUJpj+2gUWkb8bzvrz1rKoHjP1RKX8FAajUrd4qAIQvw==
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr14042885wmc.158.1612174883799; 
 Mon, 01 Feb 2021 02:21:23 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id e4sm26994287wrw.96.2021.02.01.02.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:21:23 -0800 (PST)
Date: Mon, 1 Feb 2021 11:21:20 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v2 03/10] vringh: reset kiov 'consumed' field in
 __vringh_iov()
Message-ID: <20210201102120.kvbpbne3spaqv6yz@steredhat>
References: <20210128144127.113245-1-sgarzare@redhat.com>
 <20210128144127.113245-4-sgarzare@redhat.com>
 <62bb2e93-4ac3-edf5-2baa-4c2be8257cf0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <62bb2e93-4ac3-edf5-2baa-4c2be8257cf0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, Stefan Hajnoczi <stefanha@redhat.com>
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

T24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMDE6NDA6MDFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPgo+T24gMjAyMS8xLzI4IOS4i+WNiDEwOjQxLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6
Cj4+X192cmluZ2hfaW92KCkgb3ZlcndyaXRlcyB0aGUgY29udGVudHMgb2YgcmlvdiBhbmQgd2lv
diwgaW4gZmFjdCBpdAo+PnJlc2V0cyB0aGUgJ2knIGFuZCAndXNlZCcgZmllbGRzLCBidXQgYWxz
byB0aGUgY29uc3VtZWQgZmllbGQgc2hvdWxkCj4+YmUgcmVzZXQgdG8gYXZvaWQgYW4gaW5jb25z
aXN0ZW50IHN0YXRlLgo+Pgo+PlNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dh
cnphcmVAcmVkaGF0LmNvbT4KPgo+Cj5JIGhhZCBhIHF1ZXN0aW9uKEkgcmVtZW1iZXIgd2UgaGFk
IHNvbWUgZGlzY3Vzc2lvbiBsaWtlIHRoaXMgYnV0IEkgCj5mb3JnZXQgdGhlIGNvbmNsdXNpb24p
OgoKU29ycnksIEkgZm9yZ290IHRvIHVwZGF0ZSB5b3UuCgo+Cj5JIHNlZSBlLmcgaW4gdnJpbmdo
X2dldGRlc2Nfa2VybigpIGl0IGhhcyB0aGUgZm9sbG93aW5nIGNvbW1lbnQ6Cj4KPi8qCj7CoCog
Tm90ZSB0aGF0IHlvdSBtYXkgbmVlZCB0byBjbGVhbiB1cCByaW92IGFuZCB3aW92LCBldmVuIG9u
IGVycm9yIQo+wqAqLwo+Cj5TbyBpdCBsb29rcyB0byBtZSB0aGUgY29ycmVjdCB3YXkgaXMgdG8g
Y2FsbCB2cmluZ2hfa2lvdl9jbGVhbnVwKCkgCj5iZWZvcmU/CgpMb29raW5nIGF0IHRoZSBjb2Rl
IHRoZSByaWdodCBwYXR0ZXJuIHNob3VsZCBiZToKCiAgICAgdnJpbmdoX2dldGRlc2NfKiguLi4s
ICZvdXRfaW92LCAmaW5faW92LCAuLi4pOwoKICAgICAvLyB1c2Ugb3V0X2lvdiBhbmQgaW5faW92
CgogICAgIHZyaW5naF9raW92X2NsZWFudXAoJm91dF9pb3YpOwogICAgIHZyaW5naF9raW92X2Ns
ZWFudXAoJmluX2lvdik7CgpUaGlzIGJlY2F1c2UgdnJpbmdoX2dldGRlc2NfKigpIGNhbGxzIF9f
dnJpbmdoX2lvdigpIHdoZXJlIApyZXNpemVfaW92ZWMoKSBpcyBjYWxsZWQgdG8gYWxsb2NhdGUg
dGhlIGlvdiB3cmFwcGVkIGJ5ICdzdHJ1Y3QgCnZyaW5naF9raW92JyBhbmQgdnJpbmdoX2tpb3Zf
Y2xlYW51cCgpIGZyZWVzIHRoYXQgbWVtb3J5LgoKTG9va2luZyBiZXR0ZXIsIF9fdnJpbmdoX2lv
digpIGlzIGFibGUgdG8gZXh0ZW5kIGEgJ3ZyaW5naF9raW92JyAKcHJlLWFsbG9jYXRlZCwgc28g
aW4gb3JkZXIgdG8gYXZvaWQgdG8gYWxsb2NhdGUgYW5kIGZyZWUgdGhlIGlvdiBmb3IgCmVhY2gg
cmVxdWVzdCB3ZSBjYW4gYXZvaWQgdG8gY2FsbCB2cmluZ2hfa2lvdl9jbGVhbnVwKCksIGJ1dCB0
aGlzIHBhdGNoIAppcyBuZWVkZWQgdG8gYXZvaWQgYW4gaW5jb25zaXN0ZW50IHN0YXRlLgoKQW5k
IGFsc28gcGF0Y2ggInZkcGFfc2ltOiBjbGVhbnVwIGtpb3ZzIGluIHZkcGFzaW1fZnJlZSgpIiBp
cyByZXF1aXJlZCAKdG8gZnJlZSB0aGUgaW92IHdoZW4gdGhlIGRldmljZSBpcyBnb2luZyBhd2F5
LgoKRG9lcyB0aGF0IG1ha2Ugc2Vuc2UgdG8geW91PwoKTWF5YmUgSSBzaG91bGQgYWRkIGEgY29t
bWVudCBpbiB2cmluZ2guYyB0byBleHBsYWluIHRoaXMgYmV0dGVyLgoKVGhhbmtzLApTdGVmYW5v
Cgo+Cj5UaGFua3MKPgo+Cj4+LS0tCj4+ICBkcml2ZXJzL3Zob3N0L3ZyaW5naC5jIHwgNCArKy0t
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+
PmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jIGIvZHJpdmVycy92aG9zdC92cmlu
Z2guYwo+PmluZGV4IGY2ODEyMjcwNTcxOS4uYmVlNjNkNjgyMDFhIDEwMDY0NAo+Pi0tLSBhL2Ry
aXZlcnMvdmhvc3QvdnJpbmdoLmMKPj4rKysgYi9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4+QEAg
LTI5MCw5ICsyOTAsOSBAQCBfX3ZyaW5naF9pb3Yoc3RydWN0IHZyaW5naCAqdnJoLCB1MTYgaSwK
Pj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAJaWYgKHJpb3YpCj4+LQkJcmlvdi0+aSA9IHJpb3Yt
PnVzZWQgPSAwOwo+PisJCXJpb3YtPmkgPSByaW92LT51c2VkID0gcmlvdi0+Y29uc3VtZWQgPSAw
Owo+PiAgCWlmICh3aW92KQo+Pi0JCXdpb3YtPmkgPSB3aW92LT51c2VkID0gMDsKPj4rCQl3aW92
LT5pID0gd2lvdi0+dXNlZCA9IHdpb3YtPmNvbnN1bWVkID0gMDsKPj4gIAlmb3IgKDs7KSB7Cj4+
ICAJCXZvaWQgKmFkZHI7Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
