Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A0BFDA1
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 05:27:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E9DFCF48;
	Fri, 27 Sep 2019 03:27:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A74DDF40
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 03:27:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 324658A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 03:27:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 890AE58;
	Fri, 27 Sep 2019 03:27:27 +0000 (UTC)
Received: from [10.72.12.160] (ovpn-12-160.pek2.redhat.com [10.72.12.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8DEF60BE2;
	Fri, 27 Sep 2019 03:27:14 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
Date: Fri, 27 Sep 2019 11:27:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926131439.GA11652@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 27 Sep 2019 03:27:27 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, maxime.coquelin@redhat.com,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com,
	linux-kernel@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOS8yNiDkuIvljYg5OjE0LCBUaXdlaSBCaWUgd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjYsIDIwMTkgYXQgMDQ6MzU6MThBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+
PiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAxMjo1NDoyN1BNICswODAwLCBUaXdlaSBCaWUgd3Jv
dGU6Cj4gWy4uLl0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCBi
L2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4+PiBpbmRleCA0MGQwMjhlZWQ2NDUuLjVhZmJj
MmYwOGZhMyAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4+PiAr
KysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+Pj4gQEAgLTExNiw0ICsxMTYsMTIgQEAK
Pj4+ICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfR1VFU1RfQ0lECV9JT1coVkhPU1RfVklSVElP
LCAweDYwLCBfX3U2NCkKPj4+ICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfUlVOTklORwkJX0lP
VyhWSE9TVF9WSVJUSU8sIDB4NjEsIGludCkKPj4+ICAgCj4+PiArLyogVkhPU1RfTURFViBzcGVj
aWZpYyBkZWZpbmVzICovCj4+PiArCj4+PiArI2RlZmluZSBWSE9TVF9NREVWX1NFVF9TVEFURQlf
SU9XKFZIT1NUX1ZJUlRJTywgMHg3MCwgX191NjQpCj4+PiArCj4+PiArI2RlZmluZSBWSE9TVF9N
REVWX1NfU1RPUFBFRAkwCj4+PiArI2RlZmluZSBWSE9TVF9NREVWX1NfUlVOTklORwkxCj4+PiAr
I2RlZmluZSBWSE9TVF9NREVWX1NfTUFYCTIKPj4+ICsKPj4+ICAgI2VuZGlmCj4+IFNvIGFzc3Vt
aW5nIHdlIGhhdmUgYW4gdW5kZXJseWluZyBkZXZpY2UgdGhhdCBiZWhhdmVzIGxpa2UgdmlydGlv
Ogo+IEkgdGhpbmsgdGhleSBhcmUgcmVhbGx5IGdvb2QgcXVlc3Rpb25zL3N1Z2dlc3Rpb25zLiBU
aGFua3MhCj4KPj4gMS4gU2hvdWxkIHdlIHVzZSBTRVRfU1RBVFVTIG1heWJlPwo+IEkgbGlrZSB0
aGlzIGlkZWEuIEkgd2lsbCBnaXZlIGl0IGEgdHJ5Lgo+Cj4+IDIuIERvIHdlIHdhbnQgYSByZXNl
dCBpb2N0bD8KPiBJIHRoaW5rIGl0IGlzIGhlbHBmdWwuIElmIHdlIHVzZSBTRVRfU1RBVFVTLCBt
YXliZSB3ZQo+IGNhbiB1c2UgaXQgdG8gc3VwcG9ydCB0aGUgcmVzZXQuCj4KPj4gMy4gRG8gd2Ug
d2FudCBhYmlsaXR5IHRvIGVuYWJsZSByaW5ncyBpbmRpdmlkdWFsbHk/Cj4gSSB3aWxsIG1ha2Ug
aXQgcG9zc2libGUgYXQgbGVhc3QgaW4gdGhlIHZob3N0IGxheWVyLgoKCk5vdGUgdGhlIEFQSSBz
dXBwb3J0IGUuZyBzZXRfdnFfcmVhZHkoKS4KCgo+Cj4+IDQuIERvZXMgZGV2aWNlIG5lZWQgdG8g
bGltaXQgbWF4IHJpbmcgc2l6ZT8KPj4gNS4gRG9lcyBkZXZpY2UgbmVlZCB0byBsaW1pdCBtYXgg
bnVtYmVyIG9mIHF1ZXVlcz8KPiBJIHRoaW5rIHNvLiBJdCdzIGhlbHBmdWwgdG8gaGF2ZSBpb2N0
bHMgdG8gcmVwb3J0IHRoZSBtYXgKPiByaW5nIHNpemUgYW5kIG1heCBudW1iZXIgb2YgcXVldWVz
LgoKCkFuIGlzc3VlIGlzIHRoZSBtYXggbnVtYmVyIG9mIHF1ZXVlcyBpcyBkb25lIHRocm91Z2gg
YSBkZXZpY2Ugc3BlY2lmaWMgCndheSwgdXN1YWxseSBkZXZpY2UgY29uZmlndXJhdGlvbiBzcGFj
ZS4gVGhpcyBpcyBzdXBwb3J0ZWQgYnkgdGhlIAp0cmFuc3BvcnQgQVBJLCBidXQgaG93IHRvIGV4
cG9zZSBpdCB0byB1c2Vyc3BhY2UgbWF5IG5lZWQgbW9yZSB0aG91Z2h0LgoKVGhhbmtzCgoKPgo+
IFRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
