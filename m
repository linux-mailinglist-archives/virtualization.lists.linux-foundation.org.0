Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B82307AE
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 12:30:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71DAE877D6;
	Tue, 28 Jul 2020 10:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvlMb3sIrueK; Tue, 28 Jul 2020 10:30:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B15988780F;
	Tue, 28 Jul 2020 10:30:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89952C004D;
	Tue, 28 Jul 2020 10:30:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79BD8C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 10:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 68C578671E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 10:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBF-qnARboak
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 10:30:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BB6EB86591
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595932211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eXwPZgBliCyd1sHEj5P6kwd7xBg6PnDz+mvU5GcUYk=;
 b=VAyLutPt8F4N8OZAisg9gfSO3THB9PXUcqQ2S6vqZ61qPvHSan0y73uvUt05pi7tPisZIu
 l7Qc5dNFtLZJInVatVLLrQJY/0y9J5sh+LAQHQUbBWMywSMVqeftqeqthAt9UNTb7ZxmJD
 pXTbacA2Q2j0nNQy3u3u2h613Xf+a30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-hrqz5xcqMXaBppmT1Ngusg-1; Tue, 28 Jul 2020 06:30:07 -0400
X-MC-Unique: hrqz5xcqMXaBppmT1Ngusg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9FBF101C8A7;
 Tue, 28 Jul 2020 10:30:05 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E18C171F9;
 Tue, 28 Jul 2020 10:29:53 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] vhost_vdpa: implement IRQ offloading in vhost_vdpa
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, sean.j.christopherson@intel.com,
 wanpengli@tencent.com
References: <20200728042405.17579-1-lingshan.zhu@intel.com>
 <20200728042405.17579-5-lingshan.zhu@intel.com>
 <10dd83c0-f68a-ed9e-9860-45c215fc67f6@redhat.com>
 <f3e375da-3aa8-7a0c-237c-25943667a535@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a017e479-2ea5-459f-a016-011d53e09ced@redhat.com>
Date: Tue, 28 Jul 2020 18:29:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f3e375da-3aa8-7a0c-237c-25943667a535@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, parav@mellanox.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eli@mellanox.com
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

Ck9uIDIwMjAvNy8yOCDkuIvljYg1OjE4LCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Pj4KPj4+IMKg
wqDCoMKgwqDCoCAqIHN0YXR1cyB0byAwLgo+Pj4gQEAgLTE2Nyw2ICsyMjAsMTUgQEAgc3RhdGlj
IGxvbmcgdmhvc3RfdmRwYV9zZXRfc3RhdHVzKHN0cnVjdCAKPj4+IHZob3N0X3ZkcGEgKnYsIHU4
IF9fdXNlciAqc3RhdHVzcCkKPj4+IMKgwqDCoMKgwqAgaWYgKHN0YXR1cyAhPSAwICYmIChvcHMt
PmdldF9zdGF0dXModmRwYSkgJiB+c3RhdHVzKSAhPSAwKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRUlOVkFMOwo+Pj4gwqAgK8KgwqDCoCAvKiB2cSBpcnEgaXMgbm90IGV4cGVjdGVk
IHRvIGJlIGNoYW5nZWQgb25jZSBEUklWRVJfT0sgaXMgc2V0ICovCj4+Cj4+Cj4+IFNvIHRoaXMg
YmFzaWNhbGx5IGxpbWl0IHRoZSB1c2FnZSBvZiBnZXRfdnFfaXJxKCkgaW4gdGhlIGNvbnRleHQg
Cj4+IHZob3N0X3ZkcGFfc2V0X3N0YXR1cygpIGFuZCBvdGhlciB2RFBBIGJ1cyBkcml2ZXJzJyBz
ZXRfc3RhdHVzKCkuIElmIAo+PiB0aGlzIGlzIHRydWUsIHRoZXJlJ3MgZXZlbiBubyBuZWVkIHRv
IGludHJvZHVjZSBhbnkgbmV3IGNvbmZpZyBvcHMgCj4+IGJ1dCBqdXN0IGxldCBzZXRfc3RhdHVz
KCkgdG8gcmV0dXJuIHRoZSBpcnFzIHVzZWQgZm9yIHRoZSBkZXZpY2UuIE9yIAo+PiBpZiB3ZSB3
YW50IHRoaXMgdG8gYmUgbW9yZSBnZW5lcmljLCB3ZSBuZWVkIHZwZGEncyBvd24gaXJxIG1hbmFn
ZXIgCj4+ICh3aGljaCBzaG91bGQgYmUgc2ltaWxhciB0byBpcnEgYnlwYXNzIG1hbmFnZXIpLiBU
aGF0IGlzOgo+IEkgdGhpbmsgdGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBkcml2ZXIgdG8gZnJlZSAv
IHJlLXJlcXVlc3QgaXRzIGlycXMgYWZ0ZXIgRFJJVkVSX09LIHRob3VnaCBpdCBjYW4gZG8gc28u
IElmIGEgZHJpdmVyIGNoYW5nZWQgaXRzIGlycSBvZiBhIHZxIGFmdGVyIERSSVZFUl9PSywgdGhl
IHZxIGlzIHN0aWxsIG9wZXJhdGlvbmFsIGJ1dCB3aWxsIGxvc2UgaXJxIG9mZmxvYWRpbmcgdGhh
dCBpcyByZWFzb25hYmxlLgo+IElmIHdlIHdhbnQgc2V0X3N0YXR1cygpIHJldHVybiBpcnFzLCB3
ZSBuZWVkIHRvIHJlY29yZCB0aGUgaXJxcyBzb21ld2hlcmUgaW4gdmRwYV9kZXZpY2UsCgoKV2h5
LCB3ZSBjYW4gc2ltcGx5IHBhc3MgYW4gYXJyYXkgdG8gdGhlIGRyaXZlciBJIHRoaW5rPwoKdm9p
ZCAoKnNldF9zdGF0dXMpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgdTggc3RhdHVzLCBpbnQg
KmlycXMpOwoKCj4gYXMgd2UgZGlzY3Vzc2VkIGluIGEgcHJldmlvdXMgdGhyZWFkLCB0aGlzIG1h
eSBuZWVkIGluaXRpYWxpemUgYW5kIGNsZWFudXAgd29ya3MsIHNvIGEgbmV3IG9wcwo+IHdpdGgg
cHJvcGVyIGNvbW1lbnRzIChkb24ndCBzYXkgdGhleSBjb3VsZCBub3QgY2hhbmdlIGlycSwgYnV0
IGhpZ2hsaWdodCBpZiBpcnEgY2hhbmdlcywgaXJxIG9mZmxvYWRpbmcgd2lsbCBub3Qgd29yayB0
aWxsIG5leHQgRFJJVkVSX09LKSBjb3VsZCBiZSBtb3JlIGVsZWdhbnQuCj4gSG93ZXZlciBpZiB3
ZSByZWFsbHkgbmVlZCB0byBjaGFuZ2UgaXJxIGFmdGVyIERSSVZFUl9PSywgSSB0aGluayBtYXli
ZSB3ZSBzdGlsbCBuZWVkIHZEUEEgdnEgaXJxIGFsbG9jYXRlIC8gZnJlZSBoZWxwZXJzLCB0aGVu
IHRoZSBoZWxwZXJzIGNhbiBub3QgYmUgdXNlZCBpbiBwcm9iZSgpIGFzIHdlIGRpc2N1c3NlZCBi
ZWZvcmUsIGl0IGlzIGEgc3RlcCBiYWNrIHRvIFYzIHNlcmllcy4KCgpTdGlsbCwgaXQncyBub3Qg
YWJvdXQgd2hldGhlciBkcml2ZXIgbWF5IGNoYW5nZSBpcnEgYWZ0ZXIgRFJJVkVSX09LIGJ1dCAK
aW1wbGljYXRpb24gb2YgdGhlIGFzc3VtcHRpb24uIElmIG9uZSBidXMgb3BzIG11c3QgYmUgY2Fs
bGVkIGluIGFub3RoZXIgCm9wcywgaXQncyBiZXR0ZXIgdG8ganVzdCBpbXBsZW1lbnQgdGhlbSBp
biBvbmUgb3BzLgoKCj4+Cj4+IC0gYnVzIGRyaXZlciBjYW4gcmVnaXN0ZXIgaXRzZWxmIGFzIGNv
bnN1bWVyCj4+IC0gdkRQQSBkZXZpY2UgZHJpdmVyIGNhbiByZWdpc3RlciBpdHNlbGYgYXMgcHJv
ZHVjZXIKPj4gLSBtYXRjaGluZyB2aWEgcXVldWUgaW5kZXgKPiBJTUhPLCBpcyBpdCB0b28gaGVh
dnkgZm9yIHRoaXMgZmVhdHVyZSwKCgpEbyB5b3UgbWVhbiBMT0NzPyBXZSBjYW46CgoxKSByZWZh
Y3RvciBpcnEgYnlwYXNzIG1hbmFnZXIKMikgaW52ZW50IGl0IG91ciBvd24gKGEgbXVjaCBzaW1w
bGlmaWVkIHZlcnNpb24gY29tcGFyZWQgdG8gYnlwYXNzIG1hbmFnZXIpCjMpIGVuZm9yY2luZyB0
aGVtIHZpYSB2RFBBIGJ1cwoKRWFjaCBvZiB0aGUgYWJvdmUgc2hvdWxkIGJlIG5vdCBhIGxvdCBv
ZiBjb2RpbmcuIEkgdGhpbmsgbWV0aG9kIDMgaXMgCnBhcnRpYWxseSBkb25lIGluIHlvdXIgcHJl
dmlvdXMgc2VyaWVzIGJ1dCBpbiBhbiBpbXBsaWNpdCBtYW5uZXI6CgotIGJ1cyBkcml2ZXIgdGhh
dCBoYXMgYWxsb2NfaXJxL2ZyZWVfaXJxIGltcGxlbWVudGVkIGNvdWxkIGJlIGltcGxpY2l0bHkg
CnRyZWF0ZWQgYXMgY29uc3VtZXIgcmVnaXN0ZXJpbmcKLSBldmVyeSB2RFBBIGRldmljZSBkcml2
ZXIgY291bGQgYmUgdHJlYXRlZCBhcyBwcm9kdWNlcgotIHZkcGFfZGV2bV9hbGxvY19pcnEoKSBj
b3VsZCBiZSB0cmVhdGVkIGFzIHByb2R1Y2VyIHJlZ2lzdGVyaW5nCi0gYWxsb2NfaXJxL2ZyZWVf
aXJxIGlzIHRoZSBhZGRfcHJvZHVjZXIvZGVsX3Byb2N1ZXIKCldlIHByb2JhYmx5IGp1c3QgbGFj
ayBzb21lIHN5bmNocm9uaXphdGlvbiB3aXRoIGRyaXZlciBwcm9iZS9yZW1vdmUuCgoKPiBhbmQg
aG93IGNhbiB0aGV5IG1hdGNoIGlmIHR3byBpbmRpdmlkdWFsIGFkYXB0ZXJzIGJvdGggaGF2ZSB2
cSBpZHggPSAxLgoKClRoZSBtYXRjaGluZyBpcyBwZXIgdkRQQSBkZXZpY2UuCgpUaGFua3MKCgo+
IFRoYW5rcyEKPj4gLSBkZWFsIHdpdGggcmVnaXN0ZXJpbmcvdW5yZWdpc3RlcmluZyBvZiBjb25z
dW1lci9wcm9kdWNlcgo+Pgo+PiBTbyB0aGVyZSdzIG5vIG5lZWQgdG8gY2FyZSB3aGVuIG9yIHdo
ZXJlIHRoZSB2RFBBIGRldmljZSBkcml2ZXIgdG8gCj4+IGFsbG9jYXRlIHRoZSBpcnEsIGFuZCB3
ZSBkb24ndCBuZWVkIHRvIGNhcmUgYXQgd2hpY2ggY29udGV4dCB0aGUgdkRQQSAKPj4gYnVzIGRy
aXZlciBjYW4gdXNlIHRoZSBpcnEuIEVpdGhlciBzaWRlIG1heSBnZXQgbm90aWZpZWQgd2hlbiB0
aGUgCj4+IG90aGVyIHNpZGUgaXMgZ29uZSAodGhvdWdoIHdlIG9ubHkgY2FyZSBhYm91dCB0aGUg
Z29uZSBvZiBwcm9kdWNlciAKPj4gcHJvYmFibHkpLgo+Pgo+PiBBbnkgdGhvdWdodCBvbiB0aGlz
Pwo+Pgo+PiBUaGFua3MKPj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
