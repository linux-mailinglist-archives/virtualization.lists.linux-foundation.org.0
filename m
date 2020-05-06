Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AABE1C6BDE
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 10:34:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EFA028855E;
	Wed,  6 May 2020 08:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWjvdRDFulMs; Wed,  6 May 2020 08:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E9318825E;
	Wed,  6 May 2020 08:34:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E8CEC0859;
	Wed,  6 May 2020 08:34:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A600C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6A5DF8781C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YOhFAGI+R0V0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:34:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DC062877BA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588754093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFF8NeJjiTbv8THqbxX8heqr35COUx8hMKarYhRqfLk=;
 b=YNpcCB/lKavYcpYhtnHi17wHmr9UQxNDAwTrf9ipgR0/Apkfnube8QVwKeChHPTWQH4prC
 k3fBTp+FqewdEDuCPtsnARuLAwlmH5OJDXarJvbMTm25r72Z7hTRJyGwfEiIpFWgoQeRmd
 OeQvNoKSpYGGqPDd9cI36wFFaiKMwMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-QZzC-7xwPoeKQmxnCxlf7w-1; Wed, 06 May 2020 04:34:49 -0400
X-MC-Unique: QZzC-7xwPoeKQmxnCxlf7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DEF11005510;
 Wed,  6 May 2020 08:34:48 +0000 (UTC)
Received: from [10.72.13.165] (ovpn-13-165.pek2.redhat.com [10.72.13.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963A460BEC;
 Wed,  6 May 2020 08:34:38 +0000 (UTC)
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
To: Jesper Dangaard Brouer <brouer@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506102123.739f1233@carbon>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3ecb558b-5281-2497-db3c-6aae7d7f882b@redhat.com>
Date: Wed, 6 May 2020 16:34:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506102123.739f1233@carbon>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, "Jubran,
 Samih" <sameehj@amazon.com>, bpf@vger.kernel.org
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

Ck9uIDIwMjAvNS82IOS4i+WNiDQ6MjEsIEplc3BlciBEYW5nYWFyZCBCcm91ZXIgd3JvdGU6Cj4g
T24gV2VkLCAgNiBNYXkgMjAyMCAxNDoxNjozMiArMDgwMAo+IEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4+IFdlIHRyaWVkIHRvIHJlc2VydmUgc3BhY2UgZm9yIHZu
ZXQgaGVhZGVyIGJlZm9yZQo+PiB4ZHAuZGF0YV9oYXJkX3N0YXJ0LiBCdXQgdGhpcyBpcyB1c2Vs
ZXNzIHNpbmNlIHRoZSBwYWNrZXQgY291bGQgYmUKPj4gbW9kaWZpZWQgYnkgWERQIHdoaWNoIG1h
eSBpbnZhbGlkYXRlIHRoZSBpbmZvcm1hdGlvbiBzdG9yZWQgaW4gdGhlCj4+IGhlYWRlciBhbmQK
PiBJTUhPIGFib3ZlIHN0YXRlbWVudHMgYXJlIHdyb25nLiBYRFAgY2Fubm90IGFjY2VzcyBtZW1v
cnkgYmVmb3JlCj4geGRwLmRhdGFfaGFyZF9zdGFydC4gVGh1cywgaXQgaXMgc2FmZSB0byBzdG9y
ZSBhIHZuZXQgaGVhZGVycyBiZWZvcmUKPiB4ZHAuZGF0YV9oYXJkX3N0YXJ0LiAoVGhlIHNmYyBk
cml2ZXIgYWxzbyB1c2UgdGhpcyAiYmVmb3JlIiBhcmVhKS4KCgpUaGUgcHJvYmxlbSBpcyBpZiB3
ZSBwbGFjZSB2bmV0IGhlYWRlciBiZWZvcmUgZGF0YV9oYXJkX3N0YXJ0LCAKdmlydGlvLW5ldCB3
aWxsIGZhaWwgYW55IGhlYWRlciBhZGp1c3RtZW50LgoKT3IgZG8geW91IG1lYW4gdG8gY29weSB2
bmV0IGhlYWRlciBiZWZvcmUgZGF0YV9oYXJkX3N0YXJ0IGJlZm9yZSAKcHJvY2Vzc2luZyBYRFA/
CgoKPgo+PiB0aGVyZSdzIG5vIHdheSBmb3IgWERQIHRvIGtub3cgdGhlIGV4aXN0ZW5jZSBvZiB0
aGUgdm5ldCBoZWFkZXIgY3VycmVudGx5Lgo+IEl0IGlzIHRydWUgdGhhdCBYRFAgaXMgdW5hd2Fy
ZSBvZiB0aGlzIGFyZWEsIHdoaWNoIGlzIHRoZSB3YXkgaXQKPiBzaG91bGQgYmUuICBDdXJyZW50
bHkgdGhlIGFyZWEgd2lsbCBzdXJ2aXZlIGFmdGVyIGNhbGxpbmcgQlBGL1hEUC4KPiBBZnRlciB5
b3VyIGNoYW5nZSBpdCB3aWxsIGJlIG92ZXJ3cml0dGVuIGluIHhkcF9mcmFtZSBjYXNlcy4KPgo+
Cj4+IFNvIGxldCdzIGp1c3Qgbm90IHJlc2VydmUgc3BhY2UgZm9yIHZuZXQgaGVhZGVyIGluIHRo
aXMgY2FzZS4KPiBJIHRoaW5rIHRoaXMgaXMgYSB3cm9uZyBhcHByb2FjaCEKPgo+IFdlIGFyZSB3
b3JraW5nIG9uIHN1cHBvcnRpbmcgR1JPIG11bHRpLWJ1ZmZlciBmb3IgWERQLiAgVGhlIHZuZXQg
aGVhZGVyCj4gY29udGFpbnMgR1JPIGluZm9ybWF0aW9uIChzZWUgcGFob2xlIGJlbG93IHNpZ24p
LgoKCkFub3RoZXIgbm90ZSBpcyB0aGF0IHNpbmNlIHdlIG5lZWQgcmVzZXJ2ZSByb29tIGZvciBz
a2Jfc2hhcmVkX2luZm8sIEdSTyAKZm9yIFhEUCBtYXkgcHJvYmFibHkgbGVhZCBtb3JlIGZyYWcg
bGlzdC4KCgo+ICAgSXQgaXMgY3VycmVudGx5IG5vdAo+IHVzZWQgaW4gdGhlIFhEUCBjYXNlLCBi
dXQgd2Ugd2lsbCBiZSB3b3JraW5nIHRvd2FyZHMgdXNpbmcgaXQuCgoKR29vZCB0byBrbm93IHRo
YXQsIGJ1dCBJIHRoaW5rIGl0IGNhbiBvbmx5IHdvcmsgd2hlbiB0aGUgcGFja2V0IGlzIG5vdCAK
bW9kaWZpZWQgYnkgWERQPwoKCj4gVGhlcmUKPiBhcmUgYSBsb3Qgb2YgdW5hbnN3ZXJlZCBxdWVz
dGlvbnMgb24gaG93IHRoaXMgd2lsbCBiZSBpbXBsZW1lbnRlZC4KPiBUaHVzLCBJIGNhbm5vdCBs
YXlvdXQgaG93IHdlIGFyZSBnb2luZyB0byBsZXZlcmFnZSB0aGlzIGluZm8geWV0LCBidXQKPiB5
b3VyIHBhdGNoIGFyZSBraWxsaW5nIHRoaXMgaW5mbywgd2hpY2ggSUhNTyBpcyBnb2luZyBpbiB0
aGUgd3JvbmcKPiBkaXJlY3Rpb24uCgoKSSBjYW4gY29weSB2bmV0IGhlYWRlciBhaGVhZCBvZiBk
YXRhX2hhcmRfc3RhcnQsIGRvZXMgaXQgd29yayBmb3IgeW91PwoKVGhhbmtzCgoKPgo+Cj4+IENj
OiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIDxicm91ZXJAcmVkaGF0LmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9uZXQvdmlydGlvX25ldC5jIHwgNiArKystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
dmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4+IGluZGV4IDExZjcyMjQ2
MDUxMy4uOThkZDc1YjY2NWE1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0
LmMKPj4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4+IEBAIC02ODQsOCArNjg0LDgg
QEAgc3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNl
ICpkZXYsCj4+ICAgCQkJcGFnZSA9IHhkcF9wYWdlOwo+PiAgIAkJfQo+PiAgIAo+PiAtCQl4ZHAu
ZGF0YV9oYXJkX3N0YXJ0ID0gYnVmICsgVklSVE5FVF9SWF9QQUQgKyB2aS0+aGRyX2xlbjsKPj4g
LQkJeGRwLmRhdGEgPSB4ZHAuZGF0YV9oYXJkX3N0YXJ0ICsgeGRwX2hlYWRyb29tOwo+PiArCQl4
ZHAuZGF0YV9oYXJkX3N0YXJ0ID0gYnVmICsgVklSVE5FVF9SWF9QQUQ7Cj4+ICsJCXhkcC5kYXRh
ID0geGRwLmRhdGFfaGFyZF9zdGFydCArIHhkcF9oZWFkcm9vbSArIHZpLT5oZHJfbGVuOwo+PiAg
IAkJeGRwLmRhdGFfZW5kID0geGRwLmRhdGEgKyBsZW47Cj4+ICAgCQl4ZHAuZGF0YV9tZXRhID0g
eGRwLmRhdGE7Cj4+ICAgCQl4ZHAucnhxID0gJnJxLT54ZHBfcnhxOwo+PiBAQCAtODQ1LDcgKzg0
NSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9tZXJnZWFibGUoc3RydWN0IG5l
dF9kZXZpY2UgKmRldiwKPj4gICAJCSAqIHRoZSBkZXNjcmlwdG9yIG9uIGlmIHdlIGdldCBhbiBY
RFBfVFggcmV0dXJuIGNvZGUuCj4+ICAgCQkgKi8KPj4gICAJCWRhdGEgPSBwYWdlX2FkZHJlc3Mo
eGRwX3BhZ2UpICsgb2Zmc2V0Owo+PiAtCQl4ZHAuZGF0YV9oYXJkX3N0YXJ0ID0gZGF0YSAtIFZJ
UlRJT19YRFBfSEVBRFJPT00gKyB2aS0+aGRyX2xlbjsKPj4gKwkJeGRwLmRhdGFfaGFyZF9zdGFy
dCA9IGRhdGEgLSBWSVJUSU9fWERQX0hFQURST09NOwo+PiAgIAkJeGRwLmRhdGEgPSBkYXRhICsg
dmktPmhkcl9sZW47Cj4+ICAgCQl4ZHAuZGF0YV9lbmQgPSB4ZHAuZGF0YSArIChsZW4gLSB2aS0+
aGRyX2xlbik7Cj4+ICAgCQl4ZHAuZGF0YV9tZXRhID0geGRwLmRhdGE7Cj4KPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
