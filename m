Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB81221A70
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 05:00:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F6BE88DEF;
	Thu, 16 Jul 2020 03:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaickI4fLiJi; Thu, 16 Jul 2020 02:59:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56CBC88DE8;
	Thu, 16 Jul 2020 02:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25E1CC0733;
	Thu, 16 Jul 2020 02:59:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81025C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 02:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 754C08AE78
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 02:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tefr3lmdTZ1N
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 02:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 458538AE62
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 02:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594868394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dE5m+Um8h+2SUjIIhar0TzsMcMWhB03b3rA1FsH9hrY=;
 b=DsmsZN4F3bEU+yxcrSnXzfyr5eqnLgDERDAstumaRs/OMyRTjJvSgJMcEGRka5yd91ql5O
 kFZ3hP3TVLj5n7XAc6ge6QpqOsJ5HlWA9opD0oPdi+GNiLWdNSa0Y2523HeUqaQnsRNwsA
 Y/RCt/0Mwxw6261g+b/Ts1CIv0ABDRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-ZEAagCr5PK2jvEWyxvMe5g-1; Wed, 15 Jul 2020 22:59:52 -0400
X-MC-Unique: ZEAagCr5PK2jvEWyxvMe5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 333A8800FF1;
 Thu, 16 Jul 2020 02:59:51 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 975DD5C1BD;
 Thu, 16 Jul 2020 02:59:39 +0000 (UTC)
Subject: Re: [PATCH 0/7] *** IRQ offloading for vDPA ***
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565524-3394-1-git-send-email-lingshan.zhu@intel.com>
 <70244d80-08a4-da91-3226-7bfd2019467e@redhat.com>
 <97032c51-3265-c94a-9ce1-f42fcc6d3075@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <77318609-85ef-f169-2a1e-500473976d84@redhat.com>
Date: Thu, 16 Jul 2020 10:59:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97032c51-3265-c94a-9ce1-f42fcc6d3075@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNy8xNiDkuIrljYg5OjM5LCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Cj4KPiBPbiA3
LzE1LzIwMjAgOTo0MyBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4gT24gMjAyMC83LzEyIOS4
i+WNiDEwOjUyLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+PiBIaSBBbGwsCj4+Pgo+Pj4gVGhpcyBz
ZXJpZXMgaW50ZW5kcyB0byBpbXBsZW1lbnQgSVJRIG9mZmxvYWRpbmcgZm9yCj4+PiB2aG9zdF92
ZHBhLgo+Pj4KPj4+IEJ5IHRoZSBmZWF0IG9mIGlycSBmb3J3YXJkaW5nIGZhY2lsaXRpZXMgbGlr
ZSBwb3N0ZWQKPj4+IGludGVycnVwdCBvbiBYODYsIGlycSBieXBhc3MgY2FuwqAgaGVscCBkZWxp
dmVyCj4+PiBpbnRlcnJ1cHRzIHRvIHZDUFUgZGlyZWN0bHkuCj4+Pgo+Pj4gdkRQQSBkZXZpY2Vz
IGhhdmUgZGVkaWNhdGVkIGhhcmR3YXJlIGJhY2tlbmRzIGxpa2UgVkZJTwo+Pj4gcGFzcy10aHJv
dWdoZWQgZGV2aWNlcy4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gc2V0dXAKPj4+IGlycSBv
ZmZsb2FkaW5nKGlycSBieXBhc3MpIGZvciB2RFBBIGRldmljZXMgYW5kIGdhaW4KPj4+IHBlcmZv
cm1hbmNlIGltcHJvdmVtZW50cy4KPj4+Cj4+PiBJbiBteSB0ZXN0aW5nLCB3aXRoIHRoaXMgZmVh
dHVyZSwgd2UgY2FuIHNhdmUgMC4xbXMKPj4+IGluIGEgcGluZyBiZXR3ZWVuIHR3byBWRnMgb24g
YXZlcmFnZS4KPj4KPj4KPj4gSGkgTGluZ3NoYW46Cj4+Cj4+IER1cmluZyB0aGUgdmlydGlvLW5l
dHdvcmtpbmcgbWVldGluZywgTWljaGFlbCBzcG90cyB0d28gcG9zc2libGUgaXNzdWVzOgo+Pgo+
PiAxKSBkbyB3ZSBuZWVkIGFuIG5ldyB1QVBJIHRvIHN0b3AgdGhlIGlycSBvZmZsb2FkaW5nPwo+
PiAyKSBjYW4gaW50ZXJydXB0IGxvc3QgZHVyaW5nIHRoZSBldmVudGZkIGN0eD8KPj4KPj4gRm9y
IDEpIEkgdGhpbmsgd2UgcHJvYmFibHkgbm90LCB3ZSBjYW4gYWxsb2NhdGUgYW4gaW5kZXBlbmRl
bnQgCj4+IGV2ZW50ZmQgd2hpY2ggZG9lcyBub3QgbWFwIHRvIE1TSVguIFNvIHRoZSBjb25zdW1l
ciBjYW4ndCBtYXRjaCB0aGUgCj4+IHByb2R1Y2VyIGFuZCB3ZSBmYWxsYmFjayB0byBldmVudGZk
IGJhc2VkIGlycS4KPiBIaSBKYXNvbiwKPgo+IEkgd29uZGVyIHdoeSB3ZSBuZWVkIHRvIHN0b3Ag
aXJxIG9mZmxvYWRpbmcsIGJ1dCBpZiB3ZSBuZWVkIHRvIGRvIHNvLCBtYXliZSBhIG5ldyB1QVBJ
IHdvdWxkIGJlIG1vcmUgaW50dWl0aXZlIHRvIG1lLAo+IGJ1dCB3aHkgYW5kIHdobyh1c2VyPyBx
ZW11Pykgc2hhbGwgaW5pdGlhbGl6ZSB0aGlzIHByb2Nlc3MsIGJhc2VkIG9uIHdoYXQga2luZGEg
b2YgYmFzaXMgdG8gbWFrZSB0aGUgZGVjaXNpb24/CgoKVGhlIHJlYXNvbiBpcyB3ZSBtYXkgd2Fu
dCB0byBmYWxsYmFjayB0byBzb2Z0d2FyZSBkYXRhcGF0aCBmb3Igc29tZSAKcmVhc29uIChlLmcg
c29mdHdhcmUgYXNzaXN0ZWQgbGl2ZSBtaWdyYXRpb24pLiBJbiB0aGlzIGNhc2Ugd2UgbmVlZCAK
aW50ZXJjZXB0IGRldmljZSB3cml0ZSB0byB1c2VkIHJpbmcgc28gd2UgY2FuIG5vdCBvZmZsb2Fk
aW5nIHZpcnRxdWV1ZSAKaW50ZXJydXB0IGluIHRoaXMgY2FzZS4KCgo+PiBGb3IgMikgaXQgbG9v
a3MgdG8gbWUgZ3Vlc3Qgc2hvdWxkIGRlYWwgd2l0aCB0aGUgaXJxIHN5bmNocm9uaXphdGlvbiAK
Pj4gd2hlbiBtYXNrIG9yIHVubWFzayBNU0lYIHZlY3RvcnMuCj4gQWdyZWVkIQoKCkl0J3MgYmV0
dGVyIHRvIGRvdWJsZSBjaGVjayBmb3IgdGhpcy4KClRoYW5rcwoKCj4KPiBUaGFua3MsCj4gQlIK
PiBaaHUgTGluZ3NoYW4KPj4KPj4gV2hhdCdzIHlvdXIgdGhvdWdodD8KPj4KPj4gVGhhbmtzCj4+
Cj4+Cj4+Pgo+Pj4KPj4+IFpodSBMaW5nc2hhbiAoNyk6Cj4+PiDCoMKgIHZob3N0OiBpbnRyb2R1
Y2Ugdmhvc3RfY2FsbF9jdHgKPj4+IMKgwqAga3ZtL3ZmaW86IGRldGVjdCBhc3NpZ25lZCBkZXZp
Y2UgdmlhIGlycWJ5cGFzcyBtYW5hZ2VyCj4+PiDCoMKgIHZob3N0X3ZkcGE6IGltcGxlbWVudCBJ
UlEgb2ZmbG9hZGluZyBmdW5jdGlvbnMgaW4gdmhvc3RfdmRwYQo+Pj4gwqDCoCB2RFBBOiBpbXBs
ZW1lbnQgSVJRIG9mZmxvYWRpbmcgaGVscGVycyBpbiB2RFBBIGNvcmUKPj4+IMKgwqAgdmlydGlv
X3ZkcGE6IGluaXQgSVJRIG9mZmxvYWRpbmcgZnVuY3Rpb24gcG9pbnRlcnMgdG8gTlVMTC4KPj4+
IMKgwqAgaWZjdmY6IHJlcGxhY2UgaXJxX3JlcXVlc3QvZnJlZSB3aXRoIGhlbHBlcnMgaW4gdkRQ
QSBjb3JlLgo+Pj4gwqDCoCBpcnFieXBhc3M6IGRvIG5vdCBzdGFydCBjb25zdW1lciBvciBwcm9k
dWNlciB3aGVuIGZhaWxlZCB0byBjb25uZWN0Cj4+Pgo+Pj4gwqAgYXJjaC94ODYva3ZtL3g4Ni5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrLS0KPj4+IMKgIGRyaXZlcnMvdmRw
YS9pZmN2Zi9pZmN2Zl9tYWluLmMgfCAxMSArKystLS0KPj4+IMKgIGRyaXZlcnMvdmRwYS92ZHBh
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysr
Cj4+PiDCoCBkcml2ZXJzL3Zob3N0L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAr
Cj4+PiDCoCBkcml2ZXJzL3Zob3N0L3ZkcGEuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA3NSAK
Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4+PiDCoCBkcml2
ZXJzL3Zob3N0L3Zob3N0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIyICsrKysrKysrLS0tLQo+
Pj4gwqAgZHJpdmVycy92aG9zdC92aG9zdC5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKysr
Ky0KPj4+IMKgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmPCoMKgwqAgfMKgIDIgKysKPj4+
IMKgIGluY2x1ZGUvbGludXgvdmRwYS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrKysr
Kwo+Pj4gwqAgdmlydC9rdm0vdmZpby5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDIgLS0KPj4+IMKgIHZpcnQvbGliL2lycWJ5cGFzcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDE2ICsrKysrLS0tLQo+Pj4gwqAgMTEgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMo
KyksIDI0IGRlbGV0aW9ucygtKQo+Pj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
