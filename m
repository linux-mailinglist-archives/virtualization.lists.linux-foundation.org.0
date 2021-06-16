Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6363A9B16
	for <lists.virtualization@lfdr.de>; Wed, 16 Jun 2021 14:52:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E609D404BE;
	Wed, 16 Jun 2021 12:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qwOJrsvh94A; Wed, 16 Jun 2021 12:51:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DC5EB4047D;
	Wed, 16 Jun 2021 12:51:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6831DC0024;
	Wed, 16 Jun 2021 12:51:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6862CC000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 12:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4859040619
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 12:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M73zUSWBLhqM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 12:51:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5167740331
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623847915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RFxE6z1dzCcFZAdTltB4JFa0p4EHIH2iYLpgasa9Ms=;
 b=UXB+XGEblsBxQAE7v893bAKnD9pDT9EATswjxV8Eenie6hFdaayPeFa0bteOtjwzuQVCSB
 0kViPpHb0ygaGkG/I4Ezzhwoe9p52gecnqlWBS1Y43Ka3FUfK13ZS+Zzzki22gJCvg4YDh
 ju9Ho2XhmhUwotgdlLJz7aQwi+7bTTU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-T1bC2lNPMrmlZBHOtrR48A-1; Wed, 16 Jun 2021 08:51:54 -0400
X-MC-Unique: T1bC2lNPMrmlZBHOtrR48A-1
Received: by mail-pj1-f71.google.com with SMTP id
 on11-20020a17090b1d0bb029016bba777f5fso1791801pjb.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 05:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/RFxE6z1dzCcFZAdTltB4JFa0p4EHIH2iYLpgasa9Ms=;
 b=h+O7YJAL+CuOh1vA6WRdbEEn+19mnRJZ5B47bwkvgVM2WwK92oBp4+UMh5IFnjZqMF
 ocDp987Mv6L5We4sECWGDoFNkHt8Qhna95Xqamew/uK9W5MpD2RiCnzU+NWpeFzBqaSl
 OWG9XhXolYoDBgwX03KC4Gu4kioQf6fvJfBC2xUbl+Q1MThfxh4aEY/Kr5ngrd0GHXoF
 40a6HnrBgN0hw6kPytyFL1F00+aSXaWI+ku5N2CXwBJl6Xs5SoBcALsMBCqWcOeC7baj
 HfHf7XPct3wkPgQx0iQqisTg7rA7B2YVB+LG8C1UZGqKM7VddhG2BH57IPkSTUWWHf6X
 lHRQ==
X-Gm-Message-State: AOAM531Pj5R8/VTGToR0m7DA1gRnoJayKYshvKNugFSBarpR7YWIE+7n
 R8RbJn4GiW2LC3R+181PbY4APKVfpBJZ1GnhCIGR4o3etGPeIwsBjGCOh6Cu9PE7ZcJZs90bZIg
 zaI/B58t46AbpdvRtG40twi2NQVxc8jn7LYBVeMp1pA==
X-Received: by 2002:a17:90a:a43:: with SMTP id
 o61mr4841178pjo.233.1623847913071; 
 Wed, 16 Jun 2021 05:51:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEtQw3VHh/1raIr4efqQ1l6TQ6mc8FlgoD9W6nl440ZvzySLwZ0gwqXUUn2hGSN0wmzQnz5Q==
X-Received: by 2002:a17:90a:a43:: with SMTP id
 o61mr4841149pjo.233.1623847912829; 
 Wed, 16 Jun 2021 05:51:52 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id ca6sm2345017pjb.21.2021.06.16.05.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 05:51:52 -0700 (PDT)
Subject: Re: [PATCH net-next v5 12/15] virtio-net: support AF_XDP zc tx
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <1623838784.446967-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f81775f8-7df9-5ca0-0bd2-99c86786fe78@redhat.com>
Date: Wed, 16 Jun 2021 20:51:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623838784.446967-1-xuanzhuo@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 "dust.li" <dust.li@linux.alibaba.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

CuWcqCAyMDIxLzYvMTYg5LiL5Y2INjoxOSwgWHVhbiBaaHVvIOWGmemBkzoKPj4+ICsgKiBJbiB0
aGlzIHdheSwgZXZlbiBpZiB4c2sgaGFzIGJlZW4gdW5idW5kbGVkIHdpdGggcnEvc3EsIG9yIGEg
bmV3IHhzayBhbmQKPj4+ICsgKiBycS9zcSAgYXJlIGJvdW5kLCBhbmQgYSBuZXcgdmlydG5ldF94
c2tfY3R4X2hlYWQgaXMgY3JlYXRlZC4gSXQgd2lsbCBub3QKPj4+ICsgKiBhZmZlY3QgdGhlIG9s
ZCB2aXJ0bmV0X3hza19jdHggdG8gYmUgcmVjeWNsZWQuIEFuZCBmcmVlIGFsbCBoZWFkIGFuZCBj
dHggd2hlbgo+Pj4gKyAqIHJlZiBpcyAwLgo+PiBUaGlzIGxvb2tzIGNvbXBsaWNhdGVkIGFuZCBp
dCB3aWxsIGluY3JlYXNlIHRoZSBmb290cHJpbnQuIENvbnNpZGVyIHRoZQo+PiBwZXJmb3JtYW5j
ZSBwZW5hbHR5IGFuZCB0aGUgY29tcGxleGl0eSwgSSB3b3VsZCBzdWdnZXN0IHRvIHVzZSByZXNl
dAo+PiBpbnN0ZWFkLgo+Pgo+PiBUaGVuIHdlIGRvbid0IG5lZWQgdG8gaW50cm9kdWNlIHN1Y2gg
Y29udGV4dC4KPiBJIGRvbid0IGxpa2UgdGhpcyBlaXRoZXIuIEl0IGlzIGJlc3QgaWYgd2UgY2Fu
IHJlc2V0IHRoZSBxdWV1ZSwgYnV0IHRoZW4sCj4gYWNjb3JkaW5nIHRvIG15IHVuZGVyc3RhbmRp
bmcsIHRoZSBiYWNrZW5kIHNob3VsZCBhbHNvIGJlIHN1cHBvcnRlZAo+IHN5bmNocm9ub3VzbHks
IHNvIGlmIHlvdSBkb24ndCB1cGRhdGUgdGhlIGJhY2tlbmQgc3luY2hyb25vdXNseSwgeW91IGNh
bid0IHVzZQo+IHhzay4KCgpZZXMsIGFjdHVhbGx5LCB2aG9zdC1uZXQgc3VwcG9ydCBwZXIgdnEg
c3VzcGVuZGluZy4gVGhlIHByb2JsZW0gaXMgdGhhdCAKd2UncmUgbGFja2luZyBhIHByb3BlciBB
UEkgYXQgdmlydGlvIGxldmVsLgoKVmlydGlvLXBjaSBoYXMgcXVldWVfZW5hYmxlIGJ1dCBpdCBm
b3JiaWRzIHdyaXRpbmcgemVybyB0byB0aGF0LgoKCj4KPiBJIGRvbuKAmXQgdGhpbmsgcmVzZXR0
aW5nIHRoZSBlbnRpcmUgZGV2IGlzIGEgZ29vZCBzb2x1dGlvbi4gSWYgeW91IHdhbnQgdG8gYmlu
ZAo+IHhzayB0byAxMCBxdWV1ZXMsIHlvdSBtYXkgaGF2ZSB0byByZXNldCB0aGUgZW50aXJlIGRl
dmljZSAxMCB0aW1lcy4gSSBkb27igJl0Cj4gdGhpbmsgdGhpcyBpcyBhIGdvb2Qgd2F5LiBCdXQg
dGhlIGN1cnJlbnQgc3BlYyBkb2VzIG5vdCBzdXBwb3J0IHJlc2V0IHNpbmdsZQo+IHF1ZXVlLCBz
byBJIGNob3NlIHRoZSBjdXJyZW50IHNvbHV0aW9uLgo+Cj4gSmFzb24sIHdoYXQgZG8geW91IHRo
aW5rIHdlIGFyZSBnb2luZyB0byBkbz8gUmVhbGl6ZSB0aGUgcmVzZXQgZnVuY3Rpb24gb2YgYQo+
IHNpbmdsZSBxdWV1ZT8KCgpZZXMsIGl0J3MgdGhlIGJlc3Qgd2F5LiBEbyB5b3Ugd2FudCB0byB3
b3JrIG9uIHRoYXQ/CgpXZSBjYW4gc3RhcnQgZnJvbSB0aGUgc3BlYyBwYXRjaCwgYW5kIGludHJv
ZHVjZSBpdCBhcyBiYXNpYyBmYWNpbGl0eSBhbmQgCmltcGxlbWVudCBpdCBpbiB0aGUgUENJIHRy
YW5zcG9ydCBmaXJzdC4KClRoYW5rcwoKCj4KPiBMb29raW5nIGZvcndhcmQgdG8geW91ciByZXBs
eSEhIQo+Cj4gVGhhbmtzCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
