Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F4CAE224
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 03:52:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4988EC64;
	Tue, 10 Sep 2019 01:52:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 446B0BA0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 01:52:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 566DB7D2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 01:52:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4F82A3769A;
	Tue, 10 Sep 2019 01:52:15 +0000 (UTC)
Received: from [10.72.12.185] (ovpn-12-185.pek2.redhat.com [10.72.12.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73D585D9D6;
	Tue, 10 Sep 2019 01:52:11 +0000 (UTC)
Subject: Re: [RFC PATCH untested] vhost: block speculation of translated
	descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190908110521.4031-1-mst@redhat.com>
	<db4d77d7-c467-935d-b4ae-1da7635e9b6b@redhat.com>
	<20190909104355-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9ab48e0f-50a9-bed4-1801-73c37a7da27c@redhat.com>
Date: Tue, 10 Sep 2019 09:52:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909104355-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Tue, 10 Sep 2019 01:52:15 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvOS85IOS4i+WNiDEwOjQ1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBTZXAgMDksIDIwMTkgYXQgMDM6MTk6NTVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85Lzgg5LiL5Y2INzowNSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4g
aW92ZWMgYWRkcmVzc2VzIGNvbWluZyBmcm9tIHZob3N0IGFyZSBhc3N1bWVkIHRvIGJlCj4+PiBw
cmUtdmFsaWRhdGVkLCBidXQgaW4gZmFjdCBjYW4gYmUgc3BlY3VsYXRlZCB0byBhIHZhbHVlCj4+
PiBvdXQgb2YgcmFuZ2UuCj4+Pgo+Pj4gVXNlcnNwYWNlIGFkZHJlc3MgYXJlIGxhdGVyIHZhbGlk
YXRlZCB3aXRoIGFycmF5X2luZGV4X25vc3BlYyBzbyB3ZSBjYW4KPj4+IGJlIHN1cmUga2VybmVs
IGluZm8gZG9lcyBub3QgbGVhayB0aHJvdWdoIHRoZXNlIGFkZHJlc3NlcywgYnV0IHZob3N0Cj4+
PiBtdXN0IGFsc28gbm90IGxlYWsgdXNlcnNwYWNlIGluZm8gb3V0c2lkZSB0aGUgYWxsb3dlZCBt
ZW1vcnkgdGFibGUgdG8KPj4+IGd1ZXN0cy4KPj4+Cj4+PiBGb2xsb3dpbmcgdGhlIGRlZmVuY2Ug
aW4gZGVwdGggcHJpbmNpcGxlLCBtYWtlIHN1cmUKPj4+IHRoZSBhZGRyZXNzIGlzIG5vdCB2YWxp
ZGF0ZWQgb3V0IG9mIG5vZGUgcmFuZ2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBT
LiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy92aG9zdC92
aG9zdC5jIHwgNCArKystCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBi
L2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+Pj4gaW5kZXggNWRjMTc0YWM4Y2FjLi4wZWUzNzVmYjcx
NDUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4+ICsrKyBiL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuYwo+Pj4gQEAgLTIwNzIsNyArMjA3Miw5IEBAIHN0YXRpYyBpbnQgdHJh
bnNsYXRlX2Rlc2Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsIHU2NCBhZGRyLCB1MzIgbGVu
LAo+Pj4gICAgCQlzaXplID0gbm9kZS0+c2l6ZSAtIGFkZHIgKyBub2RlLT5zdGFydDsKPj4+ICAg
IAkJX2lvdi0+aW92X2xlbiA9IG1pbigodTY0KWxlbiAtIHMsIHNpemUpOwo+Pj4gICAgCQlfaW92
LT5pb3ZfYmFzZSA9ICh2b2lkIF9fdXNlciAqKSh1bnNpZ25lZCBsb25nKQo+Pj4gLQkJCShub2Rl
LT51c2Vyc3BhY2VfYWRkciArIGFkZHIgLSBub2RlLT5zdGFydCk7Cj4+PiArCQkJKG5vZGUtPnVz
ZXJzcGFjZV9hZGRyICsKPj4+ICsJCQkgYXJyYXlfaW5kZXhfbm9zcGVjKGFkZHIgLSBub2RlLT5z
dGFydCwKPj4+ICsJCQkJCSAgICBub2RlLT5zaXplKSk7Cj4+PiAgICAJCXMgKz0gc2l6ZTsKPj4+
ICAgIAkJYWRkciArPSBzaXplOwo+Pj4gICAgCQkrK3JldDsKPj4KPj4gSSd2ZSB0cmllZCB0aGlz
IG9uIEthYnkgTGFrZSBzbWFwIG9mZiBtZXRhZGF0YSBhY2NlbGVyYXRpb24gb2ZmIHVzaW5nCj4+
IHRlc3RwbWQgKHZpcnRpby11c2VyKSArIHZob3N0X25ldC4gSSBkb24ndCBzZWUgb2J2aW91cyBw
ZXJmb3JtYW5jZQo+PiBkaWZmZXJlbmNlIHdpdGggVFggUFBTLgo+Pgo+PiBUaGFua3MKPiBTaG91
bGQgSSBwdXNoIHRoaXMgdG8gTGludXMgcmlnaHQgbm93IHRoZW4/IEl0J3MgYSBzZWN1cml0eSB0
aGluZyBzbwo+IG1heWJlIHdlIGJldHRlciBkbyBpdCBBU0FQIC4uLiB3aGF0J3MgeW91ciBvcGlu
aW9uPwoKClllcywgeW91IGNhbi4KCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPgoKCgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
