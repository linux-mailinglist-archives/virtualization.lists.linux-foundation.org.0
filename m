Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D19373DE743
	for <lists.virtualization@lfdr.de>; Tue,  3 Aug 2021 09:35:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6899E82F13;
	Tue,  3 Aug 2021 07:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJ-dKC2kPvsW; Tue,  3 Aug 2021 07:35:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C166382F2D;
	Tue,  3 Aug 2021 07:35:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EE37C000E;
	Tue,  3 Aug 2021 07:35:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE9FDC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 07:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06CE40393
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 07:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cHe3e134Tta
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 07:35:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EEB54034D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627976134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZpG8qZ893j1o8sn8JV/ZwWeTuYDoTYmM90wiNM5428=;
 b=gd0KuzK5KqLTJdiwv7wU9IOJY7R0/1bBtvYzzFn1malNOiJ409DR3VGjBb78TGss+TxYHx
 z38uCFuKHjW3xcf8bEH7au8wU8MJ+bzz1nXuosbZRYdlUFM9J0Lbpn1WeDXqj/RP2lkcvE
 sl7bGtcrhp7+YIL9IDETlKgzs7rD/g0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-ILhPY9lFNy-VY2LXZzwqTg-1; Tue, 03 Aug 2021 03:35:31 -0400
X-MC-Unique: ILhPY9lFNy-VY2LXZzwqTg-1
Received: by mail-pj1-f70.google.com with SMTP id
 o13-20020a17090a9f8db0290177972c9adeso10446197pjp.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Aug 2021 00:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mZpG8qZ893j1o8sn8JV/ZwWeTuYDoTYmM90wiNM5428=;
 b=l9OURyab/+2gMu567wBW05edS4UXd+hZP/xMaOCSvqcxVr4RnvjM19oT735nQxXNxf
 d8O/Z5jYWLrIpohRnxl+YAHsgKgrs+uiVGkf6mEgt7aMhLS9J8oZ43cZqbmJheQBcgf1
 xvp3yDw6I89FpcX7cm5nhUQjGJy+gRFp7oVCr2yj9OD/xdT7MGRrPthHXtxUEXcKGIGW
 W9b/yyVqy3mvQvpnCYfYCPsQOSEUf+efEB19GmxrvHSuVvrqCNlHYCcfPN0Ta0SScfdU
 GNwRA56lxONDaou8HGBBZdQvkdAVC6mINMTSw60pxohEKm8Fe8HXTOsIT4cheFzx92C9
 YYrQ==
X-Gm-Message-State: AOAM532qZ2WpzKRVlBVO6Sy8O4bqiL6VNDy8bmWKuhSvcGiZlxC+cD48
 BagE1Dxd1Z0XnUH4Q6VNYxgLGpr+3NxA0KrkozA1ffRuFigN7cFigPzmtW4OYqELzHr52JnyDu2
 kXPo0ER+6d9Ga/C/4sQdrliLI8uxOeD06XWJvRfhECQ==
X-Received: by 2002:a17:902:aa82:b029:12c:6463:4880 with SMTP id
 d2-20020a170902aa82b029012c64634880mr17469374plr.65.1627976130001; 
 Tue, 03 Aug 2021 00:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDMaQcIOIpmMckH/ZOtIpriUh01WThBYUtuU4942UPCJ7bwzpd6VLmbVHKx9AtSYCiMLzIyA==
X-Received: by 2002:a17:902:aa82:b029:12c:6463:4880 with SMTP id
 d2-20020a170902aa82b029012c64634880mr17469348plr.65.1627976129721; 
 Tue, 03 Aug 2021 00:35:29 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h7sm11648301pjs.38.2021.08.03.00.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 00:35:28 -0700 (PDT)
Subject: Re: [PATCH v10 17/17] Documentation: Add documentation for VDUSE
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, parav@nvidia.com,
 hch@infradead.org, christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com, joe@perches.com
References: <20210729073503.187-1-xieyongji@bytedance.com>
 <20210729073503.187-18-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <05365f36-bc3a-40f4-764d-37a7249b94b1@redhat.com>
Date: Tue, 3 Aug 2021 15:35:19 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729073503.187-18-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNy8yOSDPws7nMzozNSwgWGllIFlvbmdqaSDQtLXAOgo+IFZEVVNFICh2RFBBIERl
dmljZSBpbiBVc2Vyc3BhY2UpIGlzIGEgZnJhbWV3b3JrIHRvIHN1cHBvcnQKPiBpbXBsZW1lbnRp
bmcgc29mdHdhcmUtZW11bGF0ZWQgdkRQQSBkZXZpY2VzIGluIHVzZXJzcGFjZS4gVGhpcwo+IGRv
Y3VtZW50IGlzIGludGVuZGVkIHRvIGNsYXJpZnkgdGhlIFZEVVNFIGRlc2lnbiBhbmQgdXNhZ2Uu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWUgWW9uZ2ppIDx4aWV5b25namlAYnl0ZWRhbmNlLmNvbT4K
PiAtLS0KPiAgIERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9pbmRleC5yc3QgfCAgIDEgKwo+
ICAgRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL3ZkdXNlLnJzdCB8IDIzMiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIzMyBpbnNlcnRp
b25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBp
L3ZkdXNlLnJzdAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9p
bmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW5kZXgucnN0Cj4gaW5kZXgg
MGI1ZWVmZWQwMjdlLi5jNDMyYmUwNzBmNjcgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi91
c2Vyc3BhY2UtYXBpL2luZGV4LnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFw
aS9pbmRleC5yc3QKPiBAQCAtMjcsNiArMjcsNyBAQCBwbGFjZSB3aGVyZSB0aGlzIGluZm9ybWF0
aW9uIGlzIGdhdGhlcmVkLgo+ICAgICAgaW9tbXUKPiAgICAgIG1lZGlhL2luZGV4Cj4gICAgICBz
eXNmcy1wbGF0Zm9ybV9wcm9maWxlCj4gKyAgIHZkdXNlCj4gICAKPiAgIC4uIG9ubHk6OiAgc3Vi
cHJvamVjdCBhbmQgaHRtbAo+ICAgCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNlcnNw
YWNlLWFwaS92ZHVzZS5yc3QgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvdmR1c2UucnN0
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMwYzlkMTQ4MjEy
Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvdmR1
c2UucnN0Cj4gQEAgLTAsMCArMSwyMzIgQEAKPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ICtWRFVTRSAtICJ2RFBBIERldmljZSBpbiBVc2Vyc3BhY2UiCj4gKz09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArCj4gK3ZEUEEgKHZpcnRpbyBkYXRhIHBhdGgg
YWNjZWxlcmF0aW9uKSBkZXZpY2UgaXMgYSBkZXZpY2UgdGhhdCB1c2VzIGEKPiArZGF0YXBhdGgg
d2hpY2ggY29tcGxpZXMgd2l0aCB0aGUgdmlydGlvIHNwZWNpZmljYXRpb25zIHdpdGggdmVuZG9y
Cj4gK3NwZWNpZmljIGNvbnRyb2wgcGF0aC4gdkRQQSBkZXZpY2VzIGNhbiBiZSBib3RoIHBoeXNp
Y2FsbHkgbG9jYXRlZCBvbgo+ICt0aGUgaGFyZHdhcmUgb3IgZW11bGF0ZWQgYnkgc29mdHdhcmUu
IFZEVVNFIGlzIGEgZnJhbWV3b3JrIHRoYXQgbWFrZXMgaXQKPiArcG9zc2libGUgdG8gaW1wbGVt
ZW50IHNvZnR3YXJlLWVtdWxhdGVkIHZEUEEgZGV2aWNlcyBpbiB1c2Vyc3BhY2UuIEFuZAo+ICt0
byBtYWtlIHRoZSBkZXZpY2UgZW11bGF0aW9uIG1vcmUgc2VjdXJlLCB0aGUgZW11bGF0ZWQgdkRQ
QSBkZXZpY2Uncwo+ICtjb250cm9sIHBhdGggaXMgaGFuZGxlZCBpbiB0aGUga2VybmVsIGFuZCBv
bmx5IHRoZSBkYXRhIHBhdGggaXMKPiAraW1wbGVtZW50ZWQgaW4gdGhlIHVzZXJzcGFjZS4KPiAr
Cj4gK05vdGUgdGhhdCBvbmx5IHZpcnRpbyBibG9jayBkZXZpY2UgaXMgc3VwcG9ydGVkIGJ5IFZE
VVNFIGZyYW1ld29yayBub3csCj4gK3doaWNoIGNhbiByZWR1Y2Ugc2VjdXJpdHkgcmlza3Mgd2hl
biB0aGUgdXNlcnNwYWNlIHByb2Nlc3MgdGhhdCBpbXBsZW1lbnRzCj4gK3RoZSBkYXRhIHBhdGgg
aXMgcnVuIGJ5IGFuIHVucHJpdmlsZWdlZCB1c2VyLiBUaGUgc3VwcG9ydCBmb3Igb3RoZXIgZGV2
aWNlCj4gK3R5cGVzIGNhbiBiZSBhZGRlZCBhZnRlciB0aGUgc2VjdXJpdHkgaXNzdWUgb2YgY29y
cmVzcG9uZGluZyBkZXZpY2UgZHJpdmVyCj4gK2lzIGNsYXJpZmllZCBvciBmaXhlZCBpbiB0aGUg
ZnV0dXJlLgo+ICsKPiArQ3JlYXRlL0Rlc3Ryb3kgVkRVU0UgZGV2aWNlcwo+ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiArCj4gK1ZEVVNFIGRldmljZXMgYXJlIGNyZWF0ZWQgYXMgZm9sbG93
czoKPiArCj4gKzEuIENyZWF0ZSBhIG5ldyBWRFVTRSBpbnN0YW5jZSB3aXRoIGlvY3RsKFZEVVNF
X0NSRUFURV9ERVYpIG9uCj4gKyAgIC9kZXYvdmR1c2UvY29udHJvbC4KPiArCj4gKzIuIFNldHVw
IGVhY2ggdmlydHF1ZXVlIHdpdGggaW9jdGwoVkRVU0VfVlFfU0VUVVApIG9uIC9kZXYvdmR1c2Uv
JE5BTUUuCj4gKwo+ICszLiBCZWdpbiBwcm9jZXNzaW5nIFZEVVNFIG1lc3NhZ2VzIGZyb20gL2Rl
di92ZHVzZS8kTkFNRS4gVGhlIGZpcnN0Cj4gKyAgIG1lc3NhZ2VzIHdpbGwgYXJyaXZlIHdoaWxl
IGF0dGFjaGluZyB0aGUgVkRVU0UgaW5zdGFuY2UgdG8gdkRQQSBidXMuCj4gKwo+ICs0LiBTZW5k
IHRoZSBWRFBBX0NNRF9ERVZfTkVXIG5ldGxpbmsgbWVzc2FnZSB0byBhdHRhY2ggdGhlIFZEVVNF
Cj4gKyAgIGluc3RhbmNlIHRvIHZEUEEgYnVzLgo+ICsKPiArVkRVU0UgZGV2aWNlcyBhcmUgZGVz
dHJveWVkIGFzIGZvbGxvd3M6Cj4gKwo+ICsxLiBTZW5kIHRoZSBWRFBBX0NNRF9ERVZfREVMIG5l
dGxpbmsgbWVzc2FnZSB0byBkZXRhY2ggdGhlIFZEVVNFCj4gKyAgIGluc3RhbmNlIGZyb20gdkRQ
QSBidXMuCj4gKwo+ICsyLiBDbG9zZSB0aGUgZmlsZSBkZXNjcmlwdG9yIHJlZmVycmluZyB0byAv
ZGV2L3ZkdXNlLyROQU1FLgo+ICsKPiArMy4gRGVzdHJveSB0aGUgVkRVU0UgaW5zdGFuY2Ugd2l0
aCBpb2N0bChWRFVTRV9ERVNUUk9ZX0RFVikgb24KPiArICAgL2Rldi92ZHVzZS9jb250cm9sLgo+
ICsKPiArVGhlIG5ldGxpbmsgbWVzc2FnZXMgY2FuIGJlIHNlbnQgdmlhIHZkcGEgdG9vbCBpbiBp
cHJvdXRlMiBvciB1c2UgdGhlCj4gK2JlbG93IHNhbXBsZSBjb2RlczoKPiArCj4gKy4uIGNvZGUt
YmxvY2s6OiBjCj4gKwo+ICsJc3RhdGljIGludCBuZXRsaW5rX2FkZF92ZHVzZShjb25zdCBjaGFy
ICpuYW1lLCBlbnVtIHZkcGFfY29tbWFuZCBjbWQpCj4gKwl7Cj4gKwkJc3RydWN0IG5sX3NvY2sg
Km5sc29jazsKPiArCQlzdHJ1Y3QgbmxfbXNnICptc2c7Cj4gKwkJaW50IGZhbWlkOwo+ICsKPiAr
CQlubHNvY2sgPSBubF9zb2NrZXRfYWxsb2MoKTsKPiArCQlpZiAoIW5sc29jaykKPiArCQkJcmV0
dXJuIC1FTk9NRU07Cj4gKwo+ICsJCWlmIChnZW5sX2Nvbm5lY3Qobmxzb2NrKSkKPiArCQkJZ290
byBmcmVlX3NvY2s7Cj4gKwo+ICsJCWZhbWlkID0gZ2VubF9jdHJsX3Jlc29sdmUobmxzb2NrLCBW
RFBBX0dFTkxfTkFNRSk7Cj4gKwkJaWYgKGZhbWlkIDwgMCkKPiArCQkJZ290byBjbG9zZV9zb2Nr
Owo+ICsKPiArCQltc2cgPSBubG1zZ19hbGxvYygpOwo+ICsJCWlmICghbXNnKQo+ICsJCQlnb3Rv
IGNsb3NlX3NvY2s7Cj4gKwo+ICsJCWlmICghZ2VubG1zZ19wdXQobXNnLCBOTF9BVVRPX1BPUlQs
IE5MX0FVVE9fU0VRLCBmYW1pZCwgMCwgMCwgY21kLCAwKSkKPiArCQkJZ290byBubGFfcHV0X2Zh
aWx1cmU7Cj4gKwo+ICsJCU5MQV9QVVRfU1RSSU5HKG1zZywgVkRQQV9BVFRSX0RFVl9OQU1FLCBu
YW1lKTsKPiArCQlpZiAoY21kID09IFZEUEFfQ01EX0RFVl9ORVcpCj4gKwkJCU5MQV9QVVRfU1RS
SU5HKG1zZywgVkRQQV9BVFRSX01HTVRERVZfREVWX05BTUUsICJ2ZHVzZSIpOwo+ICsKPiArCQlp
ZiAobmxfc2VuZF9zeW5jKG5sc29jaywgbXNnKSkKPiArCQkJZ290byBjbG9zZV9zb2NrOwo+ICsK
PiArCQlubF9jbG9zZShubHNvY2spOwo+ICsJCW5sX3NvY2tldF9mcmVlKG5sc29jayk7Cj4gKwo+
ICsJCXJldHVybiAwOwo+ICsJbmxhX3B1dF9mYWlsdXJlOgo+ICsJCW5sbXNnX2ZyZWUobXNnKTsK
PiArCWNsb3NlX3NvY2s6Cj4gKwkJbmxfY2xvc2Uobmxzb2NrKTsKPiArCWZyZWVfc29jazoKPiAr
CQlubF9zb2NrZXRfZnJlZShubHNvY2spOwo+ICsJCXJldHVybiAtMTsKPiArCX0KPiArCj4gK0hv
dyBWRFVTRSB3b3Jrcwo+ICstLS0tLS0tLS0tLS0tLS0KPiArCj4gK0FzIG1lbnRpb25lZCBhYm92
ZSwgYSBWRFVTRSBkZXZpY2UgaXMgY3JlYXRlZCBieSBpb2N0bChWRFVTRV9DUkVBVEVfREVWKSBv
bgo+ICsvZGV2L3ZkdXNlL2NvbnRyb2wuIFdpdGggdGhpcyBpb2N0bCwgdXNlcnNwYWNlIGNhbiBz
cGVjaWZ5IHNvbWUgYmFzaWMgY29uZmlndXJhdGlvbgo+ICtzdWNoIGFzIGRldmljZSBuYW1lICh1
bmlxdWVseSBpZGVudGlmeSBhIFZEVVNFIGRldmljZSksIHZpcnRpbyBmZWF0dXJlcywgdmlydGlv
Cj4gK2NvbmZpZ3VyYXRpb24gc3BhY2UsIHRoZSBudW1iZXIgb2YgdmlydHF1ZXVlcyBhbmQgc28g
b24gZm9yIHRoaXMgZW11bGF0ZWQgZGV2aWNlLgo+ICtUaGVuIGEgY2hhciBkZXZpY2UgaW50ZXJm
YWNlICgvZGV2L3ZkdXNlLyROQU1FKSBpcyBleHBvcnRlZCB0byB1c2Vyc3BhY2UgZm9yIGRldmlj
ZQo+ICtlbXVsYXRpb24uIFVzZXJzcGFjZSBjYW4gdXNlIHRoZSBWRFVTRV9WUV9TRVRVUCBpb2N0
bCBvbiAvZGV2L3ZkdXNlLyROQU1FIHRvCj4gK2FkZCBwZXItdmlydHF1ZXVlIGNvbmZpZ3VyYXRp
b24gc3VjaCBhcyB0aGUgbWF4IHNpemUgb2YgdmlydHF1ZXVlIHRvIHRoZSBkZXZpY2UuCj4gKwo+
ICtBZnRlciB0aGUgaW5pdGlhbGl6YXRpb24sIHRoZSBWRFVTRSBkZXZpY2UgY2FuIGJlIGF0dGFj
aGVkIHRvIHZEUEEgYnVzIHZpYQo+ICt0aGUgVkRQQV9DTURfREVWX05FVyBuZXRsaW5rIG1lc3Nh
Z2UuIFVzZXJzcGFjZSBuZWVkcyB0byByZWFkKCkvd3JpdGUoKSBvbgo+ICsvZGV2L3ZkdXNlLyRO
QU1FIHRvIHJlY2VpdmUvcmVwbHkgc29tZSBjb250cm9sIG1lc3NhZ2VzIGZyb20vdG8gVkRVU0Ug
a2VybmVsCj4gK21vZHVsZSBhcyBmb2xsb3dzOgo+ICsKPiArLi4gY29kZS1ibG9jazo6IGMKPiAr
Cj4gKwlzdGF0aWMgaW50IHZkdXNlX21lc3NhZ2VfaGFuZGxlcihpbnQgZGV2X2ZkKQo+ICsJewo+
ICsJCWludCBsZW47Cj4gKwkJc3RydWN0IHZkdXNlX2Rldl9yZXF1ZXN0IHJlcTsKPiArCQlzdHJ1
Y3QgdmR1c2VfZGV2X3Jlc3BvbnNlIHJlc3A7Cj4gKwo+ICsJCWxlbiA9IHJlYWQoZGV2X2ZkLCAm
cmVxLCBzaXplb2YocmVxKSk7Cj4gKwkJaWYgKGxlbiAhPSBzaXplb2YocmVxKSkKPiArCQkJcmV0
dXJuIC0xOwo+ICsKPiArCQlyZXNwLnJlcXVlc3RfaWQgPSByZXEucmVxdWVzdF9pZDsKPiArCj4g
KwkJc3dpdGNoIChyZXEudHlwZSkgewo+ICsKPiArCQkvKiBoYW5kbGUgZGlmZmVyZW50IHR5cGVz
IG9mIG1lc3NhZ2VzICovCj4gKwo+ICsJCX0KPiArCj4gKwkJbGVuID0gd3JpdGUoZGV2X2ZkLCAm
cmVzcCwgc2l6ZW9mKHJlc3ApKTsKPiArCQlpZiAobGVuICE9IHNpemVvZihyZXNwKSkKPiArCQkJ
cmV0dXJuIC0xOwo+ICsKPiArCQlyZXR1cm4gMDsKPiArCX0KPiArCj4gK1RoZXJlIGFyZSBub3cg
dGhyZWUgdHlwZXMgb2YgbWVzc2FnZXMgaW50cm9kdWNlZCBieSBWRFVTRSBmcmFtZXdvcms6Cj4g
Kwo+ICstIFZEVVNFX0dFVF9WUV9TVEFURTogR2V0IHRoZSBzdGF0ZSBmb3IgdmlydHF1ZXVlLCB1
c2Vyc3BhY2Ugc2hvdWxkIHJldHVybgo+ICsgIGF2YWlsIGluZGV4IGZvciBzcGxpdCB2aXJ0cXVl
dWUgb3IgdGhlIGRldmljZS9kcml2ZXIgcmluZyB3cmFwIGNvdW50ZXJzIGFuZAo+ICsgIHRoZSBh
dmFpbCBhbmQgdXNlZCBpbmRleCBmb3IgcGFja2VkIHZpcnRxdWV1ZS4KPiArCj4gKy0gVkRVU0Vf
U0VUX1NUQVRVUzogU2V0IHRoZSBkZXZpY2Ugc3RhdHVzLCB1c2Vyc3BhY2Ugc2hvdWxkIGZvbGxv
dwo+ICsgIHRoZSB2aXJ0aW8gc3BlYzogaHR0cHM6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL3ZpcnRp
by92aXJ0aW8vdjEuMS92aXJ0aW8tdjEuMS5odG1sCj4gKyAgdG8gcHJvY2VzcyB0aGlzIG1lc3Nh
Z2UuIEZvciBleGFtcGxlLCBmYWlsIHRvIHNldCB0aGUgRkVBVFVSRVNfT0sgZGV2aWNlCj4gKyAg
c3RhdHVzIGJpdCBpZiB0aGUgZGV2aWNlIGNhbiBub3QgYWNjZXB0IHRoZSBuZWdvdGlhdGVkIHZp
cnRpbyBmZWF0dXJlcwo+ICsgIGdldCBmcm9tIHRoZSBWRFVTRV9ERVZfR0VUX0ZFQVRVUkVTIGlv
Y3RsLgoKCkkgd29uZGVyIGlmIGl0J3MgYmV0dGVyIHRvIGFkZCBhIHNlY3Rpb24gYWJvdXQgdGhl
IGZ1dHVyZSB3b3JrPwoKRS5nIHRoZSBzdXBwb3J0IGZvciB0aGUgdXNlcnNwYWNlIGRldmljZSB0
byBtb2RpZnkgc3RhdHVzIChsaWtlIApORUVEU19SRVNFVCkuCgoKPiArCj4gKy0gVkRVU0VfVVBE
QVRFX0lPVExCOiBOb3RpZnkgdXNlcnNwYWNlIHRvIHVwZGF0ZSB0aGUgbWVtb3J5IG1hcHBpbmcg
Zm9yIHNwZWNpZmllZAo+ICsgIElPVkEgcmFuZ2UsIHVzZXJzcGFjZSBzaG91bGQgZmlyc3RseSBy
ZW1vdmUgdGhlIG9sZCBtYXBwaW5nLCB0aGVuIHNldHVwIHRoZSBuZXcKPiArICBtYXBwaW5nIHZp
YSB0aGUgVkRVU0VfSU9UTEJfR0VUX0ZEIGlvY3RsLgo+ICsKPiArQWZ0ZXIgRFJJVkVSX09LIHN0
YXR1cyBiaXQgaXMgc2V0IHZpYSB0aGUgVkRVU0VfU0VUX1NUQVRVUyBtZXNzYWdlLCB1c2Vyc3Bh
Y2UgaXMKPiArYWJsZSB0byBzdGFydCB0aGUgZGF0YXBsYW5lIHByb2Nlc3NpbmcgYXMgZm9sbG93
czoKPiArCj4gKzEuIEdldCB0aGUgc3BlY2lmaWVkIHZpcnRxdWV1ZSdzIGluZm9ybWF0aW9uIHdp
dGggdGhlIFZEVVNFX1ZRX0dFVF9JTkZPIGlvY3RsLAo+ICsgICBpbmNsdWRpbmcgdGhlIHNpemUs
IHRoZSBJT1ZBcyBvZiBkZXNjcmlwdG9yIHRhYmxlLCBhdmFpbGFibGUgcmluZyBhbmQgdXNlZCBy
aW5nLAo+ICsgICB0aGUgc3RhdGUgYW5kIHRoZSByZWFkeSBzdGF0dXMuCj4gKwo+ICsyLiBQYXNz
IHRoZSBhYm92ZSBJT1ZBcyB0byB0aGUgVkRVU0VfSU9UTEJfR0VUX0ZEIGlvY3RsIHNvIHRoYXQg
dGhvc2UgSU9WQSByZWdpb25zCj4gKyAgIGNhbiBiZSBtYXBwZWQgaW50byB1c2Vyc3BhY2UuIFNv
bWUgc2FtcGxlIGNvZGVzIGlzIHNob3duIGJlbG93Ogo+ICsKPiArLi4gY29kZS1ibG9jazo6IGMK
PiArCj4gKwlzdGF0aWMgaW50IHBlcm1fdG9fcHJvdCh1aW50OF90IHBlcm0pCj4gKwl7Cj4gKwkJ
aW50IHByb3QgPSAwOwo+ICsKPiArCQlzd2l0Y2ggKHBlcm0pIHsKPiArCQljYXNlIFZEVVNFX0FD
Q0VTU19XTzoKPiArCQkJcHJvdCB8PSBQUk9UX1dSSVRFOwo+ICsJCQlicmVhazsKPiArCQljYXNl
IFZEVVNFX0FDQ0VTU19STzoKPiArCQkJcHJvdCB8PSBQUk9UX1JFQUQ7Cj4gKwkJCWJyZWFrOwo+
ICsJCWNhc2UgVkRVU0VfQUNDRVNTX1JXOgo+ICsJCQlwcm90IHw9IFBST1RfUkVBRCB8IFBST1Rf
V1JJVEU7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCj4gKwkJcmV0dXJuIHByb3Q7Cj4gKwl9Cj4g
Kwo+ICsJc3RhdGljIHZvaWQgKmlvdmFfdG9fdmEoaW50IGRldl9mZCwgdWludDY0X3QgaW92YSwg
dWludDY0X3QgKmxlbikKPiArCXsKPiArCQlpbnQgZmQ7Cj4gKwkJdm9pZCAqYWRkcjsKPiArCQlz
aXplX3Qgc2l6ZTsKPiArCQlzdHJ1Y3QgdmR1c2VfaW90bGJfZW50cnkgZW50cnk7Cj4gKwo+ICsJ
CWVudHJ5LnN0YXJ0ID0gaW92YTsKPiArCQllbnRyeS5sYXN0ID0gaW92YTsKPiArCj4gKwkJLyoK
PiArCQkgKiBGaW5kIHRoZSBmaXJzdCBJT1ZBIHJlZ2lvbiB0aGF0IG92ZXJsYXBzIHdpdGggdGhl
IHNwZWNpZmllZAo+ICsJCSAqIHJhbmdlIFtzdGFydCwgbGFzdF0gYW5kIHJldHVybiB0aGUgY29y
cmVzcG9uZGluZyBmaWxlIGRlc2NyaXB0b3IuCj4gKwkJICovCj4gKwkJZmQgPSBpb2N0bChkZXZf
ZmQsIFZEVVNFX0lPVExCX0dFVF9GRCwgJmVudHJ5KTsKPiArCQlpZiAoZmQgPCAwKQo+ICsJCQly
ZXR1cm4gTlVMTDsKPiArCj4gKwkJc2l6ZSA9IGVudHJ5Lmxhc3QgLSBlbnRyeS5zdGFydCArIDE7
Cj4gKwkJKmxlbiA9IGVudHJ5Lmxhc3QgLSBpb3ZhICsgMTsKPiArCQlhZGRyID0gbW1hcCgwLCBz
aXplLCBwZXJtX3RvX3Byb3QoZW50cnkucGVybSksIE1BUF9TSEFSRUQsCj4gKwkJCSAgICBmZCwg
ZW50cnkub2Zmc2V0KTsKPiArCQljbG9zZShmZCk7Cj4gKwkJaWYgKGFkZHIgPT0gTUFQX0ZBSUxF
RCkKPiArCQkJcmV0dXJuIE5VTEw7Cj4gKwo+ICsJCS8qCj4gKwkJICogVXNpbmcgc29tZSBkYXRh
IHN0cnVjdHVyZXMgc3VjaCBhcyBsaW5rZWQgbGlzdCB0byBzdG9yZQo+ICsJCSAqIHRoZSBpb3Rs
YiBtYXBwaW5nLiBUaGUgbXVubWFwKDIpIHNob3VsZCBiZSBjYWxsZWQgZm9yIHRoZQo+ICsJCSAq
IGNhY2hlZCBtYXBwaW5nIHdoZW4gdGhlIGNvcnJlc3BvbmRpbmcgVkRVU0VfVVBEQVRFX0lPVExC
Cj4gKwkJICogbWVzc2FnZSBpcyByZWNlaXZlZCBvciB0aGUgZGV2aWNlIGlzIHJlc2V0Lgo+ICsJ
CSAqLwo+ICsKPiArCQlyZXR1cm4gYWRkciArIGlvdmEgLSBlbnRyeS5zdGFydDsKPiArCX0KPiAr
Cj4gKzMuIFNldHVwIHRoZSBraWNrIGV2ZW50ZmQgZm9yIHRoZSBzcGVjaWZpZWQgdmlydHF1ZXVl
cyB3aXRoIHRoZSBWRFVTRV9WUV9TRVRVUF9LSUNLRkQKPiArICAgaW9jdGwuIFRoZSBraWNrIGV2
ZW50ZmQgaXMgdXNlZCBieSBWRFVTRSBrZXJuZWwgbW9kdWxlIHRvIG5vdGlmeSB1c2Vyc3BhY2Ug
dG8KPiArICAgY29uc3VtZSB0aGUgYXZhaWxhYmxlIHJpbmcuCj4gKwo+ICs0LiBMaXN0ZW4gdG8g
dGhlIGtpY2sgZXZlbnRmZCBhbmQgY29uc3VtZSB0aGUgYXZhaWxhYmxlIHJpbmcuIFRoZSBidWZm
ZXIgZGVzY3JpYmVkCj4gKyAgIGJ5IHRoZSBkZXNjcmlwdG9ycyBpbiB0aGUgZGVzY3JpcHRvciB0
YWJsZSBzaG91bGQgYmUgYWxzbyBtYXBwZWQgaW50byB1c2Vyc3BhY2UKPiArICAgdmlhIHRoZSBW
RFVTRV9JT1RMQl9HRVRfRkQgaW9jdGwgYmVmb3JlIGFjY2Vzc2luZy4KCgooT3IgdXNlcnNwYWNl
IG1heSBwb2xsIHRoZSBpbmRpY2VzIGluc3RlYWQsIHRoZSBraWNrIGV2ZW50ZmQgaXMgbm90IGEg
bXVzdCkuCgoKVGhhbmtzCgoKPiArCj4gKzUuIEluamVjdCBhbiBpbnRlcnJ1cHQgZm9yIHNwZWNp
ZmljIHZpcnRxdWV1ZSB3aXRoIHRoZSBWRFVTRV9JTkpFQ1RfVlFfSVJRIGlvY3RsCj4gKyAgIGFm
dGVyIHRoZSB1c2VkIHJpbmcgaXMgZmlsbGVkLgo+ICsKPiArRm9yIG1vcmUgZGV0YWlscyBvbiB0
aGUgdUFQSSwgcGxlYXNlIHNlZSBpbmNsdWRlL3VhcGkvbGludXgvdmR1c2UuaC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
