Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFF3C7C68
	for <lists.virtualization@lfdr.de>; Wed, 14 Jul 2021 05:04:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC9D283B73;
	Wed, 14 Jul 2021 03:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRo7nvFmJO_I; Wed, 14 Jul 2021 03:04:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 316BD83B7C;
	Wed, 14 Jul 2021 03:04:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B504FC001F;
	Wed, 14 Jul 2021 03:04:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FC61C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0572183B73
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qweWETuaH1ZJ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:04:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC22F83AFB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626231880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dt39hgR3TCbA4So26eoQKwSZdlXSs+WH9pS39/Tpb4k=;
 b=JQ4OGn4UQvZSXL96p9uXHs8jiNrGtBYNNTSkfH6n/xZrRL0T+ALdIAXOzpBrf8dzZPFesH
 TPYPmCNbOT0LWuarOjKZt5ja1H2l51Wu1ZK7S5aGtbDz/s4WaAVSm0ifIyrEHYSkCAB30t
 PYvnE6bp28NFVWGQaUQkcw8fLTDvw7g=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-tlijEzzrOXG_TMqqj8zMBQ-1; Tue, 13 Jul 2021 23:04:39 -0400
X-MC-Unique: tlijEzzrOXG_TMqqj8zMBQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 k25-20020a635a590000b02902288bbae35bso478481pgm.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 20:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dt39hgR3TCbA4So26eoQKwSZdlXSs+WH9pS39/Tpb4k=;
 b=gQ4mmCEczJf1nuGfadapzYeCZQECOYKKbfkTx/rHPMND82glugrIGH5M9+MlOMWFtg
 hKEtVHy+bsEGBwWOE3E6fljDl287JxyaLKJR0P73Q4kIrUEkHqMDLAt6QaRZsfTY1yr+
 o7VdHyKQpNmA9IHkuyyNJnBHSBYjRlZEoCl+Yh9EgbfyuWtL+fvqodFNm9Et6H8MNWOD
 7MLdkNofFnxtRSLLwlnVAPt6j8OYgHuHMLPHl5OQxNmRHrTVP5Q78ztSffSZMZUEleat
 JiYnsnBCl0Ekf0F7p+K8ZVJrsmUFd8rfvZ6ElBuLhBealuvEU6ajdsql+cHrcef7XLWK
 Uu9g==
X-Gm-Message-State: AOAM530WtDt0nfX3V6fX6rjnX/13T08VGsDF74W+R9uFLzP4lXmsjZGB
 YgQpTr9C39jlQIZsZTcTs+hsY0BLaTPot0Qw54InF5grXwwi59ZBngPK0vqSQd433Nnrr2NbmJe
 ENnaFufgONshr4U3N5FgjAvMyXxRV1JCbHzCHhq17ZQjAkiv91AebtTPME1V+knAB0Z1UgT7ZHy
 T5NAdLxzJHx2JNpJ7umw==
X-Received: by 2002:a17:902:7246:b029:129:dcf5:b583 with SMTP id
 c6-20020a1709027246b0290129dcf5b583mr5994630pll.73.1626231878302; 
 Tue, 13 Jul 2021 20:04:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYXIk0cQ8yABYM8CWPAOCyvLBqwBZMqOrjv/MDVqBpHXvDwT2YFUrlgEArcS+rk6/ytP/YxQ==
X-Received: by 2002:a17:902:7246:b029:129:dcf5:b583 with SMTP id
 c6-20020a1709027246b0290129dcf5b583mr5994591pll.73.1626231877870; 
 Tue, 13 Jul 2021 20:04:37 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a20sm550813pfv.101.2021.07.13.20.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 20:04:36 -0700 (PDT)
Subject: Re: [RFC v3 21/29] vhost: Add VhostIOVATree
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-22-eperezma@redhat.com>
 <755e2d24-946b-775c-e4e9-e81a16e7b6dd@redhat.com>
 <CAJaqyWfKTiKeKLLjB9qDf4qJwL420YRo6FrJgozp_tn0Z57pOA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <882296f9-adea-9b3b-5a2f-df0c746b4ad1@redhat.com>
Date: Wed, 14 Jul 2021 11:04:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfKTiKeKLLjB9qDf4qJwL420YRo6FrJgozp_tn0Z57pOA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Eric Blake <eblake@redhat.com>,
 Michael Lilja <ml@napatech.com>
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

CuWcqCAyMDIxLzYvMSDkuIvljYg0OjE1LCBFdWdlbmlvIFBlcmV6IE1hcnRpbiDlhpnpgZM6Cj4g
T24gTW9uLCBNYXkgMzEsIDIwMjEgYXQgMTE6NDAgQU0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4+Cj4+IOWcqCAyMDIxLzUvMjAg5LiK5Y2IMTI6MjgsIEV1Z2VuaW8g
UMOpcmV6IOWGmemBkzoKPj4+IFRoaXMgdHJlZSBpcyBhYmxlIHRvIGxvb2sgZm9yIGEgdHJhbnNs
YXRlZCBhZGRyZXNzIGZyb20gYSBJT1ZBIGFkZHJlc3MuCj4+Pgo+Pj4gQXQgZmlyc3QgZ2xhbmNl
IGlzIHNpbWlsYXIgdG8gdXRpbC9pb3ZhLXRyZWUuIEhvd2V2ZXIsIFNWUSB3b3JraW5nIG9uCj4+
PiBkZXZpY2VzIHdpdGggbGltaXRlZCBJT1ZBIHNwYWNlIG5lZWQgbW9yZSBjYXBhYmlsaXRpZXMs
IGxpa2UgYWxsb2NhdGluZwo+Pj4gSU9WQSBjaHVua3Mgb3IgcGVyZm9ybSByZXZlcnNlIHRyYW5z
bGF0aW9ucyAocWVtdSBhZGRyZXNzZXMgdG8gaW92YSkuCj4+Pgo+Pj4gU3RhcnRpbmcgYSBzZXBw
YXJhdGVkIGltcGxlbWVudGF0aW9uLiBLbm93aW5nIHRoYW4gaW5zZXJ0aW9ucy9kZWxldGlvbnMK
Pj4+IHdpbGwgbm90IGJlIGFzIGZyZXF1ZW50IGFzIHNlYXJjaGVzLAo+Pgo+PiBUaGlzIG1pZ2h0
IG5vdCBiZSB0cnVlIGlmIHZJT01NVSBpcyBlbmFibGVkLgo+Pgo+IFJpZ2h0Lgo+Cj4+PiBpdCB1
c2VzIGFuIG9yZGVyZWQgYXJyYXkgYXQKPj4+IGltcGxlbWVudGF0aW9uLgo+Pgo+PiBJIHdvbmRl
ciBob3cgbXVjaCBvdmVyaGVhZCBjb3VsZCBnX2FycmF5IGJlIGlmIGl0IG5lZWRzIHRvIGdyb3cu
Cj4+Cj4gSSBkaWRuJ3QgZG8gYW55IHRlc3RzLCBhY3R1YWxseS4gQnV0IEkgc2VlIHRoaXMgVmhv
c3RJT1ZBVHJlZSBhcyBhCj4gcmVwbGFjZWFibGUgdG9vbCwganVzdCB0byBnZXQgdGhlIGJ1ZmZl
ciB0cmFuc2xhdGlvbnMgdG8gd29yay4gU28gSSdtCj4gYm90aCBvayB3aXRoIGNoYW5nZSBpdCBu
b3cgYW5kIG9rIHRvIGRlbGF5IGl0LCBzaW5jZSB0aGV5IHNob3VsZCBub3QKPiBiZSBoYXJkIHRv
IGRvLgo+Cj4+PiAgICBBIGRpZmZlcmVudCBuYW1lIGNvdWxkIGJlIHVzZWQsIGJ1dCBvcmRlcmVk
Cj4+PiBzZWFyY2hhYmxlIGFycmF5IGlzIGEgbGl0dGxlIGJpdCBsb25nIHRob3VnaC4KPj4KPj4g
Tm90ZSB0aGF0IHdlIGhhZCBhIHZlcnkgZ29vZCBleGFtcGxlIGZvciB0aGlzLiBUaGF0IGlzIHRo
ZSBrZXJuZWwgaW92YQo+PiBhbGxvY2F0b3Igd2hpY2ggaXMgaW1wbGVtZW50ZWQgdmlhIHJidHJl
ZS4KPj4KPj4gSW5zdGVhZCBvZiBmaWd1cmluZyBvdXQgZ19hcnJheSB2cyBnX3RyZWUgc3R1ZmZz
LCBJIHdvdWxkIHNpbXBsZSBnbyB3aXRoCj4+IGdfdHJlZSBmaXJzdCAoYmFzZWQgb24gdXRpbC9p
b3ZhLXRyZWUpIGFuZCBib3Jyb3cgdGhlIHdlbGwgZGVzaWduIGtlcm5lbAo+PiBpb3ZhIGFsbG9j
YXRvciBBUEkgdG8gaGF2ZSBhIGdlbmVyaWMgSU9WQSBvbmUgaW5zdGVhZCBvZiBjb3VwbGluZyBp
dAo+PiB3aXRoIHZob3N0LiBJdCBjb3VsZCBiZSB1c2VkIGJ5IG90aGVyIHVzZXJzcGFjZSBkcml2
ZXIgaW4gdGhlIGZ1dHVyZToKPj4KPj4gaW5pdF9pb3ZhX2RvbWFpbigpL3B1dF9pb3ZhX2RvbWFp
bigpOwo+Pgo+PiBhbGxvY19pb3ZhKCkvZnJlZV9pb3ZhKCk7Cj4+Cj4+IGZpbmRfaW92YSgpOwo+
Pgo+IFdlIGNvdWxkIGdvIHRoYXQgd2F5LCBidXQgdGhlbiB0aGUgaW92YS10cmVlIHNob3VsZCBi
ZSBleHRlbmRlZCB0bwo+IHN1cHBvcnQgYm90aCB0cmFuc2xhdGlvbnMgKGlvdmEtPnRyYW5zbGF0
ZWRfYWRkciBpcyBub3cgaW1wbGVtZW50ZWQgaW4KPiBpb3ZhLXRyZWUsIHRoZSByZXZlcnNlIGlz
IG5vdCkuIElmIEkgdW5kZXJzdG9vZCB5b3UgY29ycmVjdGx5LAo+IGJvcnJvd2luZyB0aGUga2Vy
bmVsIGlvdmEgYWxsb2NhdG9yIHdvdWxkIGdpdmUgdXMgYm90aCwgcmlnaHQ/CgoKTm8gdGhlIHJl
dmVyc2UgbG9va3VwIGlzIGRvbmUgdmlhIGEgc3BlY2lmaWMgSU9NTVUgZHJpdmVyIGlmIEkgCnVu
ZGVyc3RhbmQgaXQgY29ycmVjdGx5LgoKQW5kIGlmIHRoZSBtYXBwaW5nIGlzIDE6MSB3ZSBjYW4g
anVzdCB1c2UgdHdvIGlvdmEtdHJlZSBJIGd1ZXNzLgoKCj4KPiBOb3RlIHRoYXQgaXQgaXMgbm90
IGNvdXBsZWQgdG8gdmhvc3QgYXQgYWxsIGV4Y2VwdCBpbiB0aGUgbmFtZTogYWxsCj4gdGhlIGlt
cGxlbWVudGF0aW9ucyBvbmx5IHdvcmsgd2l0aCBod2FkZHIgYW5kIHZvaWQgcG9pbnRlcnMgbWVt
b3J5Lgo+IEp1c3QgdG8gaWxsdXN0cmF0ZSB0aGUgcG9pbnQsIEkgdGhpbmsgaXQgY291bGQgYmUg
YSBkcm9wLWluCj4gcmVwbGFjZW1lbnQgZm9yIGlvdmEtdHJlZSBhdCB0aGlzIG1vbWVudCAod2l0
aCBhbGwgdGhlCj4gZHJhd2JhY2tzL2FkdmFudGFnZXMgb2YgYW4gYXJyYXkgdnMgdHJlZSkuCgoK
T2suCgpUaGFua3MKCgo+Cj4+IEFub3RoZXIgcmVmZXJlbmNlIGlzIHRoZSBpb3ZhIGFsbG9jYXRv
ciB0aGF0IGlzIGltcGxlbWVudGVkIGluIFZGSU8uCj4gSSB3aWxsIGNoZWNrIHRoaXMgdG9vLgo+
Cj4gVGhhbmtzIQo+Cj4KPj4gVGhhbmtzCj4+Cj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBFdWdlbmlv
IFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gICAgaHcvdmlydGlvL3Zo
b3N0LWlvdmEtdHJlZS5oIHwgIDUwICsrKysrKysrKysKPj4+ICAgIGh3L3ZpcnRpby92aG9zdC1p
b3ZhLXRyZWUuYyB8IDE4OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
ICAgIGh3L3ZpcnRpby9tZXNvbi5idWlsZCAgICAgICB8ICAgMiArLQo+Pj4gICAgMyBmaWxlcyBj
aGFuZ2VkLCAyMzkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4gICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGh3L3ZpcnRpby92aG9zdC1pb3ZhLXRyZWUuaAo+Pj4gICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGh3L3ZpcnRpby92aG9zdC1pb3ZhLXRyZWUuYwo+Pj4KPj4+IGRpZmYgLS1naXQgYS9o
dy92aXJ0aW8vdmhvc3QtaW92YS10cmVlLmggYi9ody92aXJ0aW8vdmhvc3QtaW92YS10cmVlLmgK
Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi4yYTQ0YWY4YjNh
Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9ody92aXJ0aW8vdmhvc3QtaW92YS10cmVlLmgK
Pj4+IEBAIC0wLDAgKzEsNTAgQEAKPj4+ICsvKgo+Pj4gKyAqIHZob3N0IHNvZnR3YXJlIGxpdmUg
bWlncmF0aW9uIHJpbmcKPj4+ICsgKgo+Pj4gKyAqIFNQRFgtRmlsZUNvcHlyaWdodFRleHQ6IFJl
ZCBIYXQsIEluYy4gMjAyMQo+Pj4gKyAqIFNQRFgtRmlsZUNvbnRyaWJ1dG9yOiBBdXRob3I6IEV1
Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgo+Pj4gKyAqCj4+PiArICogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKPj4+ICsgKi8KPj4+ICsKPj4+ICsj
aWZuZGVmIEhXX1ZJUlRJT19WSE9TVF9JT1ZBX1RSRUVfSAo+Pj4gKyNkZWZpbmUgSFdfVklSVElP
X1ZIT1NUX0lPVkFfVFJFRV9ICj4+PiArCj4+PiArI2luY2x1ZGUgPGdtb2R1bGUuaD4KPj4+ICsK
Pj4+ICsjaW5jbHVkZSAiZXhlYy9tZW1vcnkuaCIKPj4+ICsKPj4+ICt0eXBlZGVmIHN0cnVjdCBW
aG9zdERNQU1hcCB7Cj4+PiArICAgIHZvaWQgKnRyYW5zbGF0ZWRfYWRkcjsKPj4+ICsgICAgaHdh
ZGRyIGlvdmE7Cj4+PiArICAgIGh3YWRkciBzaXplOyAgICAgICAgICAgICAgICAvKiBJbmNsdXNp
dmUgKi8KPj4+ICsgICAgSU9NTVVBY2Nlc3NGbGFncyBwZXJtOwo+Pj4gK30gVmhvc3RETUFNYXA7
Cj4+PiArCj4+PiArdHlwZWRlZiBlbnVtIFZob3N0RE1BTWFwTmV3UkMgewo+Pj4gKyAgICBWSE9T
VF9ETUFfTUFQX09WRVJMQVAgPSAtMiwKPj4+ICsgICAgVkhPU1RfRE1BX01BUF9JTlZBTElEID0g
LTEsCj4+PiArICAgIFZIT1NUX0RNQV9NQVBfT0sgPSAwLAo+Pj4gK30gVmhvc3RETUFNYXBOZXdS
QzsKPj4+ICsKPj4+ICsvKioKPj4+ICsgKiBWaG9zdElPVkFUcmVlCj4+PiArICoKPj4+ICsgKiBT
dG9yZSBhbmQgc2VhcmNoIElPVkEgLT4gVHJhbnNsYXRlZCBtYXBwaW5ncy4KPj4+ICsgKgo+Pj4g
KyAqIE5vdGUgdGhhdCBpdCBjYW5ub3QgcmVtb3ZlIG5vZGVzLgo+Pj4gKyAqLwo+Pj4gK3R5cGVk
ZWYgc3RydWN0IFZob3N0SU9WQVRyZWUgewo+Pj4gKyAgICAvKiBPcmRlcmVkIGFycmF5IG9mIHJl
dmVyc2UgdHJhbnNsYXRpb25zLCBJT1ZBIGFkZHJlc3MgdG8gcWVtdSBtZW1vcnkuICovCj4+PiAr
ICAgIEdBcnJheSAqaW92YV90YWRkcl9tYXA7Cj4+PiArfSBWaG9zdElPVkFUcmVlOwo+Pj4gKwo+
Pj4gK3ZvaWQgdmhvc3RfaW92YV90cmVlX25ldyhWaG9zdElPVkFUcmVlICppb3ZhX3JtKTsKPj4+
ICt2b2lkIHZob3N0X2lvdmFfdHJlZV9kZXN0cm95KFZob3N0SU9WQVRyZWUgKmlvdmFfcm0pOwo+
Pj4gKwo+Pj4gK2NvbnN0IFZob3N0RE1BTWFwICp2aG9zdF9pb3ZhX3RyZWVfZmluZF90YWRkcihj
b25zdCBWaG9zdElPVkFUcmVlICppb3ZhX3JtLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBWaG9zdERNQU1hcCAqbWFwKTsKPj4+ICtWaG9z
dERNQU1hcE5ld1JDIHZob3N0X2lvdmFfdHJlZV9pbnNlcnQoVmhvc3RJT1ZBVHJlZSAqaW92YV9y
bSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVmhvc3RETUFN
YXAgKm1hcCk7Cj4+PiArCj4+PiArI2VuZGlmCj4+PiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zo
b3N0LWlvdmEtdHJlZS5jIGIvaHcvdmlydGlvL3Zob3N0LWlvdmEtdHJlZS5jCj4+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uZGZkN2U0NDhiNQo+Pj4gLS0tIC9k
ZXYvbnVsbAo+Pj4gKysrIGIvaHcvdmlydGlvL3Zob3N0LWlvdmEtdHJlZS5jCj4+PiBAQCAtMCww
ICsxLDE4OCBAQAo+Pj4gKy8qCj4+PiArICogdmhvc3Qgc29mdHdhcmUgbGl2ZSBtaWdyYXRpb24g
cmluZwo+Pj4gKyAqCj4+PiArICogU1BEWC1GaWxlQ29weXJpZ2h0VGV4dDogUmVkIEhhdCwgSW5j
LiAyMDIxCj4+PiArICogU1BEWC1GaWxlQ29udHJpYnV0b3I6IEF1dGhvcjogRXVnZW5pbyBQw6ly
ZXogPGVwZXJlem1hQHJlZGhhdC5jb20+Cj4+PiArICoKPj4+ICsgKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+Pj4gKyAqLwo+Pj4gKwo+Pj4gKyNpbmNsdWRlICJx
ZW11L29zZGVwLmgiCj4+PiArI2luY2x1ZGUgInZob3N0LWlvdmEtdHJlZS5oIgo+Pj4gKwo+Pj4g
KyNkZWZpbmUgR19BUlJBWV9OT1RfWkVST19URVJNSU5BVEVEIGZhbHNlCj4+PiArI2RlZmluZSBH
X0FSUkFZX05PVF9DTEVBUl9PTl9BTExPQyBmYWxzZQo+Pj4gKwo+Pj4gKy8qKgo+Pj4gKyAqIElu
c2VydHMgYW4gZWxlbWVudCBhZnRlciBhbiBleGlzdGluZyBvbmUgaW4gZ2FycmF5Lgo+Pj4gKyAq
Cj4+PiArICogQGFycmF5ICAgICAgVGhlIGFycmF5Cj4+PiArICogQHByZXZfZWxlbSAgVGhlIHBy
ZXZpb3VzIGVsZW1lbnQgb2YgYXJyYXkgb2YgTlVMTCBpZiBwcmVwZW5kaW5nCj4+PiArICogQG1h
cCAgICAgICAgVGhlIERNQSBtYXAKPj4+ICsgKgo+Pj4gKyAqIEl0IHByb3ZpZGVzIHRoZSBhZGl0
aW9uYWwgYWR2YW50YWdlIG9mIGJlaW5nIHR5cGUgc2FmZSBvdmVyCj4+PiArICogZ19hcnJheV9p
bnNlcnRfdmFsLCB3aGljaCBhY2NlcHRzIGEgcmVmZXJlbmNlIHBvaW50ZXIgaW5zdGVhZCBvZiBh
IHZhbHVlCj4+PiArICogd2l0aCBubyBjb21wbGFpbnMuCj4+PiArICovCj4+PiArc3RhdGljIHZv
aWQgdmhvc3RfaW92YV90cmVlX2luc2VydF9hZnRlcihHQXJyYXkgKmFycmF5LAo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgVmhvc3RETUFNYXAgKnBy
ZXZfZWxlbSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IFZob3N0RE1BTWFwICptYXApCj4+PiArewo+Pj4gKyAgICBzaXplX3QgcG9zOwo+Pj4gKwo+
Pj4gKyAgICBpZiAoIXByZXZfZWxlbSkgewo+Pj4gKyAgICAgICAgcG9zID0gMDsKPj4+ICsgICAg
fSBlbHNlIHsKPj4+ICsgICAgICAgIHBvcyA9IHByZXZfZWxlbSAtICZnX2FycmF5X2luZGV4KGFy
cmF5LCB0eXBlb2YoKnByZXZfZWxlbSksIDApICsgMTsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAg
ICBnX2FycmF5X2luc2VydF92YWwoYXJyYXksIHBvcywgKm1hcCk7Cj4+PiArfQo+Pj4gKwo+Pj4g
K3N0YXRpYyBnaW50IHZob3N0X2lvdmFfdHJlZV9jbXBfaW92YShnY29uc3Rwb2ludGVyIGEsIGdj
b25zdHBvaW50ZXIgYikKPj4+ICt7Cj4+PiArICAgIGNvbnN0IFZob3N0RE1BTWFwICptMSA9IGEs
ICptMiA9IGI7Cj4+PiArCj4+PiArICAgIGlmIChtMS0+aW92YSA+IG0yLT5pb3ZhICsgbTItPnNp
emUpIHsKPj4+ICsgICAgICAgIHJldHVybiAxOwo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIGlm
IChtMS0+aW92YSArIG0xLT5zaXplIDwgbTItPmlvdmEpIHsKPj4+ICsgICAgICAgIHJldHVybiAt
MTsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICAvKiBPdmVybGFwcGVkICovCj4+PiArICAgIHJl
dHVybiAwOwo+Pj4gK30KPj4+ICsKPj4+ICsvKioKPj4+ICsgKiBGaW5kIHRoZSBwcmV2aW91cyBu
b2RlIHRvIGEgZ2l2ZW4gaW92YQo+Pj4gKyAqCj4+PiArICogQGFycmF5ICBUaGUgYXNjZW5kaW5n
IG9yZGVyZWQtYnktdHJhbnNsYXRlZC1hZGRyIGFycmF5IG9mIFZob3N0RE1BTWFwCj4+PiArICog
QG1hcCAgICBUaGUgbWFwIHRvIGluc2VydAo+Pj4gKyAqIEBwcmV2ICAgUmV0dXJuZWQgbG9jYXRp
b24gb2YgdGhlIHByZXZpb3VzIG1hcAo+Pj4gKyAqCj4+PiArICogUmV0dXJuIFZIT1NUX0RNQV9N
QVBfT0sgaWYgZXZlcnl0aGluZyB3ZW50IHdlbGwsIG9yIFZIT1NUX0RNQV9NQVBfT1ZFUkxBUCBp
Zgo+Pj4gKyAqIGl0IGFscmVhZHkgZXhpc3RzLiBJdCBpcyBvayB0byB1c2UgdGhpcyBmdW5jdGlv
biB0byBjaGVjayBpZiBhIGdpdmVuIHJhbmdlCj4+PiArICogZXhpc3RzLCBidXQgaXQgd2lsbCB1
c2UgYSBsaW5lYXIgc2VhcmNoLgo+Pj4gKyAqCj4+PiArICogVE9ETzogV2UgY2FuIHVzZSBic2Vh
cmNoIHRvIGxvY2F0ZSB0aGUgZW50cnkgaWYgd2Ugc2F2ZSB0aGUgc3RhdGUgaW4gdGhlCj4+PiAr
ICogbmVlZGxlLCBrbm93aW5nIHRoYXQgdGhlIG5lZWRsZSBpcyBhbHdheXMgdGhlIGZpcnN0IGFy
Z3VtZW50IHRvCj4+PiArICogY29tcGFyZV9mdW5jLgo+Pj4gKyAqLwo+Pj4gK3N0YXRpYyBWaG9z
dERNQU1hcE5ld1JDIHZob3N0X2lvdmFfdHJlZV9maW5kX3ByZXYoY29uc3QgR0FycmF5ICphcnJh
eSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEdDb21wYXJlRnVuYyBjb21wYXJlX2Z1bmMsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBWaG9zdERNQU1hcCAqbWFwLAo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgVmhv
c3RETUFNYXAgKipwcmV2KQo+Pj4gK3sKPj4+ICsgICAgc2l6ZV90IGk7Cj4+PiArICAgIGludCBy
Owo+Pj4gKwo+Pj4gKyAgICAqcHJldiA9IE5VTEw7Cj4+PiArICAgIGZvciAoaSA9IDA7IGkgPCBh
cnJheS0+bGVuOyArK2kpIHsKPj4+ICsgICAgICAgIHIgPSBjb21wYXJlX2Z1bmMobWFwLCAmZ19h
cnJheV9pbmRleChhcnJheSwgdHlwZW9mKCptYXApLCBpKSk7Cj4+PiArICAgICAgICBpZiAociA9
PSAwKSB7Cj4+PiArICAgICAgICAgICAgcmV0dXJuIFZIT1NUX0RNQV9NQVBfT1ZFUkxBUDsKPj4+
ICsgICAgICAgIH0KPj4+ICsgICAgICAgIGlmIChyIDwgMCkgewo+Pj4gKyAgICAgICAgICAgIHJl
dHVybiBWSE9TVF9ETUFfTUFQX09LOwo+Pj4gKyAgICAgICAgfQo+Pj4gKwo+Pj4gKyAgICAgICAg
KnByZXYgPSAmZ19hcnJheV9pbmRleChhcnJheSwgdHlwZW9mKCoqcHJldiksIGkpOwo+Pj4gKyAg
ICB9Cj4+PiArCj4+PiArICAgIHJldHVybiBWSE9TVF9ETUFfTUFQX09LOwo+Pj4gK30KPj4+ICsK
Pj4+ICsvKioKPj4+ICsgKiBDcmVhdGUgYSBuZXcgSU9WQSB0cmVlCj4+PiArICoKPj4+ICsgKiBA
dHJlZSAgVGhlIElPVkEgdHJlZQo+Pj4gKyAqLwo+Pj4gK3ZvaWQgdmhvc3RfaW92YV90cmVlX25l
dyhWaG9zdElPVkFUcmVlICp0cmVlKQo+Pj4gK3sKPj4+ICsgICAgYXNzZXJ0KHRyZWUpOwo+Pj4g
Kwo+Pj4gKyAgICB0cmVlLT5pb3ZhX3RhZGRyX21hcCA9IGdfYXJyYXlfbmV3KEdfQVJSQVlfTk9U
X1pFUk9fVEVSTUlOQVRFRCwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBHX0FSUkFZX05PVF9DTEVBUl9PTl9BTExPQywKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplb2YoVmhvc3RETUFNYXApKTsKPj4+ICt9Cj4+PiArCj4+
PiArLyoqCj4+PiArICogRGVzdHJveSBhbiBJT1ZBIHRyZWUKPj4+ICsgKgo+Pj4gKyAqIEB0cmVl
ICBUaGUgaW92YSB0cmVlCj4+PiArICovCj4+PiArdm9pZCB2aG9zdF9pb3ZhX3RyZWVfZGVzdHJv
eShWaG9zdElPVkFUcmVlICp0cmVlKQo+Pj4gK3sKPj4+ICsgICAgZ19hcnJheV91bnJlZihnX3N0
ZWFsX3BvaW50ZXIoJnRyZWUtPmlvdmFfdGFkZHJfbWFwKSk7Cj4+PiArfQo+Pj4gKwo+Pj4gKy8q
Kgo+Pj4gKyAqIFBlcmZvcm0gYSBzZWFyY2ggb24gYSBHQXJyYXkuCj4+PiArICoKPj4+ICsgKiBA
YXJyYXkgR2xpYiBhcnJheQo+Pj4gKyAqIEBtYXAgTWFwIHRvIGxvb2sgdXAKPj4+ICsgKiBAY29t
cGFyZV9mdW5jIENvbXBhcmUgZnVuY3Rpb24gdG8gdXNlCj4+PiArICoKPj4+ICsgKiBSZXR1cm4g
VGhlIGZvdW5kIGVsZW1lbnQgb3IgTlVMTCBpZiBub3QgZm91bmQuCj4+PiArICoKPj4+ICsgKiBU
aGlzIGNhbiBiZSByZXBsYWNlZCB3aXRoIGdfYXJyYXlfYmluYXJ5X3NlYXJjaCAoU2luY2UgZ2xp
YiAyLjYyKSB3aGVuIHRoYXQKPj4+ICsgKiBpcyBjb21tb24gZW5vdWdoLgo+Pj4gKyAqLwo+Pj4g
K3N0YXRpYyBjb25zdCBWaG9zdERNQU1hcCAqdmhvc3RfaW92YV90cmVlX2JzZWFyY2goY29uc3Qg
R0FycmF5ICphcnJheSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IFZob3N0RE1BTWFwICptYXAsCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHQ29tcGFyZUZ1bmMgY29tcGFyZV9m
dW5jKQo+Pj4gK3sKPj4+ICsgICAgcmV0dXJuIGJzZWFyY2gobWFwLCBhcnJheS0+ZGF0YSwgYXJy
YXktPmxlbiwgc2l6ZW9mKCptYXApLCBjb21wYXJlX2Z1bmMpOwo+Pj4gK30KPj4+ICsKPj4+ICsv
KioKPj4+ICsgKiBGaW5kIHRoZSB0cmFuc2xhdGVkIGFkZHJlc3Mgc3RvcmVkIGZyb20gYSBJT1ZB
IGFkZHJlc3MKPj4+ICsgKgo+Pj4gKyAqIEB0cmVlICBUaGUgaW92YSB0cmVlCj4+PiArICogQG1h
cCAgIFRoZSBtYXAgd2l0aCB0aGUgbWVtb3J5IGFkZHJlc3MKPj4+ICsgKgo+Pj4gKyAqIFJldHVy
biB0aGUgc3RvcmVkIG1hcHBpbmcsIG9yIE5VTEwgaWYgbm90IGZvdW5kLgo+Pj4gKyAqLwo+Pj4g
K2NvbnN0IFZob3N0RE1BTWFwICp2aG9zdF9pb3ZhX3RyZWVfZmluZF90YWRkcihjb25zdCBWaG9z
dElPVkFUcmVlICp0cmVlLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBWaG9zdERNQU1hcCAqbWFwKQo+Pj4gK3sKPj4+ICsgICAgcmV0dXJu
IHZob3N0X2lvdmFfdHJlZV9ic2VhcmNoKHRyZWUtPmlvdmFfdGFkZHJfbWFwLCBtYXAsCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZob3N0X2lvdmFfdHJlZV9jbXBfaW92
YSk7Cj4+PiArfQo+Pj4gKwo+Pj4gKy8qKgo+Pj4gKyAqIEluc2VydCBhIG5ldyBtYXAKPj4+ICsg
Kgo+Pj4gKyAqIEB0cmVlICBUaGUgaW92YSB0cmVlCj4+PiArICogQG1hcCAgIFRoZSBpb3ZhIG1h
cAo+Pj4gKyAqCj4+PiArICogUmV0dXJuczoKPj4+ICsgKiAtIFZIT1NUX0RNQV9NQVBfT0sgaWYg
dGhlIG1hcCBmaXRzIGluIHRoZSBjb250YWluZXIKPj4+ICsgKiAtIFZIT1NUX0RNQV9NQVBfSU5W
QUxJRCBpZiB0aGUgbWFwIGRvZXMgbm90IG1ha2Ugc2Vuc2UgKGxpa2Ugc2l6ZSBvdmVyZmxvdykK
Pj4+ICsgKiAtIFZIT1NUX0RNQV9NQVBfT1ZFUkxBUCBpZiB0aGUgdHJlZSBhbHJlYWR5IGNvbnRh
aW5zIHRoYXQgbWFwCj4+PiArICogQ2FuIHF1ZXJ5IHRoZSBhc3NpZ25hdGVkIGlvdmEgaW4gbWFw
Lgo+Pj4gKyAqLwo+Pj4gK1Zob3N0RE1BTWFwTmV3UkMgdmhvc3RfaW92YV90cmVlX2luc2VydChW
aG9zdElPVkFUcmVlICp0cmVlLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBWaG9zdERNQU1hcCAqbWFwKQo+Pj4gK3sKPj4+ICsgICAgY29uc3QgVmhvc3RETUFN
YXAgKnByZXY7Cj4+PiArICAgIGludCBmaW5kX3ByZXZfcmM7Cj4+PiArCj4+PiArICAgIGlmICht
YXAtPnRyYW5zbGF0ZWRfYWRkciArIG1hcC0+c2l6ZSA8IG1hcC0+dHJhbnNsYXRlZF9hZGRyIHx8
Cj4+PiArICAgICAgICBtYXAtPmlvdmEgKyBtYXAtPnNpemUgPCBtYXAtPmlvdmEgfHwgbWFwLT5w
ZXJtID09IElPTU1VX05PTkUpIHsKPj4+ICsgICAgICAgIHJldHVybiBWSE9TVF9ETUFfTUFQX0lO
VkFMSUQ7Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgLyogQ2hlY2sgZm9yIGR1cGxpY2F0ZXMs
IGFuZCBzYXZlIHBvc2l0aW9uIGZvciBpbnNlcnRpb24gKi8KPj4+ICsgICAgZmluZF9wcmV2X3Jj
ID0gdmhvc3RfaW92YV90cmVlX2ZpbmRfcHJldih0cmVlLT5pb3ZhX3RhZGRyX21hcCwKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aG9zdF9pb3ZhX3Ry
ZWVfY21wX2lvdmEsIG1hcCwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmcHJldik7Cj4+PiArICAgIGlmIChmaW5kX3ByZXZfcmMgPT0gVkhPU1RfRE1B
X01BUF9PVkVSTEFQKSB7Cj4+PiArICAgICAgICByZXR1cm4gVkhPU1RfRE1BX01BUF9PVkVSTEFQ
Owo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIHZob3N0X2lvdmFfdHJlZV9pbnNlcnRfYWZ0ZXIo
dHJlZS0+aW92YV90YWRkcl9tYXAsIHByZXYsIG1hcCk7Cj4+PiArICAgIHJldHVybiBWSE9TVF9E
TUFfTUFQX09LOwo+Pj4gK30KPj4+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vbWVzb24uYnVpbGQg
Yi9ody92aXJ0aW8vbWVzb24uYnVpbGQKPj4+IGluZGV4IDhiNWEwMjI1ZmUuLmNiMzA2YjgzYzYg
MTAwNjQ0Cj4+PiAtLS0gYS9ody92aXJ0aW8vbWVzb24uYnVpbGQKPj4+ICsrKyBiL2h3L3ZpcnRp
by9tZXNvbi5idWlsZAo+Pj4gQEAgLTExLDcgKzExLDcgQEAgc29mdG1tdV9zcy5hZGQod2hlbjog
J0NPTkZJR19BTEwnLCBpZl90cnVlOiBmaWxlcygndmhvc3Qtc3R1Yi5jJykpCj4+Pgo+Pj4gICAg
dmlydGlvX3NzID0gc3Muc291cmNlX3NldCgpCj4+PiAgICB2aXJ0aW9fc3MuYWRkKGZpbGVzKCd2
aXJ0aW8uYycpKQo+Pj4gLXZpcnRpb19zcy5hZGQod2hlbjogJ0NPTkZJR19WSE9TVCcsIGlmX3Ry
dWU6IGZpbGVzKCd2aG9zdC5jJywgJ3Zob3N0LWJhY2tlbmQuYycsICd2aG9zdC1zaGFkb3ctdmly
dHF1ZXVlLmMnKSkKPj4+ICt2aXJ0aW9fc3MuYWRkKHdoZW46ICdDT05GSUdfVkhPU1QnLCBpZl90
cnVlOiBmaWxlcygndmhvc3QuYycsICd2aG9zdC1iYWNrZW5kLmMnLCAndmhvc3Qtc2hhZG93LXZp
cnRxdWV1ZS5jJywgJ3Zob3N0LWlvdmEtdHJlZS5jJykpCj4+PiAgICB2aXJ0aW9fc3MuYWRkKHdo
ZW46ICdDT05GSUdfVkhPU1RfVVNFUicsIGlmX3RydWU6IGZpbGVzKCd2aG9zdC11c2VyLmMnKSkK
Pj4+ICAgIHZpcnRpb19zcy5hZGQod2hlbjogJ0NPTkZJR19WSE9TVF9WRFBBJywgaWZfdHJ1ZTog
ZmlsZXMoJ3Zob3N0LXZkcGEuYycpKQo+Pj4gICAgdmlydGlvX3NzLmFkZCh3aGVuOiAnQ09ORklH
X1ZJUlRJT19CQUxMT09OJywgaWZfdHJ1ZTogZmlsZXMoJ3ZpcnRpby1iYWxsb29uLmMnKSkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
