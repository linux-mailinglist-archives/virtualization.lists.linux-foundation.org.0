Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8ECAE4A5
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 09:28:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6860FE20;
	Tue, 10 Sep 2019 07:28:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 92BAE265
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 07:28:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3CCE983A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 07:28:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A41AF81F2F;
	Tue, 10 Sep 2019 07:28:33 +0000 (UTC)
Received: from [10.72.12.188] (ovpn-12-188.pek2.redhat.com [10.72.12.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23B5660BF3;
	Tue, 10 Sep 2019 07:28:28 +0000 (UTC)
Subject: Re: [RFC PATCH untested] vhost: block speculation of translated
	descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190908110521.4031-1-mst@redhat.com>
	<db4d77d7-c467-935d-b4ae-1da7635e9b6b@redhat.com>
	<20190909104355-mutt-send-email-mst@kernel.org>
	<9ab48e0f-50a9-bed4-1801-73c37a7da27c@redhat.com>
	<20190910024814-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bb71974e-a8b3-4cc4-f3e1-e48118469b78@redhat.com>
Date: Tue, 10 Sep 2019 15:28:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910024814-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 10 Sep 2019 07:28:33 +0000 (UTC)
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

Ck9uIDIwMTkvOS8xMCDkuIvljYgyOjQ4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBTZXAgMTAsIDIwMTkgYXQgMDk6NTI6MTBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85Lzkg5LiL5Y2IMTA6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIE1vbiwgU2VwIDA5LCAyMDE5IGF0IDAzOjE5OjU1UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS85Lzgg5LiL5Y2INzowNSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+Pj4+PiBpb3ZlYyBhZGRyZXNzZXMgY29taW5nIGZyb20gdmhvc3QgYXJlIGFzc3VtZWQgdG8g
YmUKPj4+Pj4gcHJlLXZhbGlkYXRlZCwgYnV0IGluIGZhY3QgY2FuIGJlIHNwZWN1bGF0ZWQgdG8g
YSB2YWx1ZQo+Pj4+PiBvdXQgb2YgcmFuZ2UuCj4+Pj4+Cj4+Pj4+IFVzZXJzcGFjZSBhZGRyZXNz
IGFyZSBsYXRlciB2YWxpZGF0ZWQgd2l0aCBhcnJheV9pbmRleF9ub3NwZWMgc28gd2UgY2FuCj4+
Pj4+IGJlIHN1cmUga2VybmVsIGluZm8gZG9lcyBub3QgbGVhayB0aHJvdWdoIHRoZXNlIGFkZHJl
c3NlcywgYnV0IHZob3N0Cj4+Pj4+IG11c3QgYWxzbyBub3QgbGVhayB1c2Vyc3BhY2UgaW5mbyBv
dXRzaWRlIHRoZSBhbGxvd2VkIG1lbW9yeSB0YWJsZSB0bwo+Pj4+PiBndWVzdHMuCj4+Pj4+Cj4+
Pj4+IEZvbGxvd2luZyB0aGUgZGVmZW5jZSBpbiBkZXB0aCBwcmluY2lwbGUsIG1ha2Ugc3VyZQo+
Pj4+PiB0aGUgYWRkcmVzcyBpcyBub3QgdmFsaWRhdGVkIG91dCBvZiBub2RlIHJhbmdlLgo+Pj4+
Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29t
Pgo+Pj4+PiAtLS0KPj4+Pj4gICAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYyB8IDQgKysrLQo+Pj4+
PiAgICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+
Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5jIGIvZHJpdmVycy92aG9z
dC92aG9zdC5jCj4+Pj4+IGluZGV4IDVkYzE3NGFjOGNhYy4uMGVlMzc1ZmI3MTQ1IDEwMDY0NAo+
Pj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4+Pj4gKysrIGIvZHJpdmVycy92aG9z
dC92aG9zdC5jCj4+Pj4+IEBAIC0yMDcyLDcgKzIwNzIsOSBAQCBzdGF0aWMgaW50IHRyYW5zbGF0
ZV9kZXNjKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLCB1NjQgYWRkciwgdTMyIGxlbiwKPj4+
Pj4gICAgIAkJc2l6ZSA9IG5vZGUtPnNpemUgLSBhZGRyICsgbm9kZS0+c3RhcnQ7Cj4+Pj4+ICAg
ICAJCV9pb3YtPmlvdl9sZW4gPSBtaW4oKHU2NClsZW4gLSBzLCBzaXplKTsKPj4+Pj4gICAgIAkJ
X2lvdi0+aW92X2Jhc2UgPSAodm9pZCBfX3VzZXIgKikodW5zaWduZWQgbG9uZykKPj4+Pj4gLQkJ
CShub2RlLT51c2Vyc3BhY2VfYWRkciArIGFkZHIgLSBub2RlLT5zdGFydCk7Cj4+Pj4+ICsJCQko
bm9kZS0+dXNlcnNwYWNlX2FkZHIgKwo+Pj4+PiArCQkJIGFycmF5X2luZGV4X25vc3BlYyhhZGRy
IC0gbm9kZS0+c3RhcnQsCj4+Pj4+ICsJCQkJCSAgICBub2RlLT5zaXplKSk7Cj4+Pj4+ICAgICAJ
CXMgKz0gc2l6ZTsKPj4+Pj4gICAgIAkJYWRkciArPSBzaXplOwo+Pj4+PiAgICAgCQkrK3JldDsK
Pj4+PiBJJ3ZlIHRyaWVkIHRoaXMgb24gS2FieSBMYWtlIHNtYXAgb2ZmIG1ldGFkYXRhIGFjY2Vs
ZXJhdGlvbiBvZmYgdXNpbmcKPj4+PiB0ZXN0cG1kICh2aXJ0aW8tdXNlcikgKyB2aG9zdF9uZXQu
IEkgZG9uJ3Qgc2VlIG9idmlvdXMgcGVyZm9ybWFuY2UKPj4+PiBkaWZmZXJlbmNlIHdpdGggVFgg
UFBTLgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+PiBTaG91bGQgSSBwdXNoIHRoaXMgdG8gTGludXMgcmln
aHQgbm93IHRoZW4/IEl0J3MgYSBzZWN1cml0eSB0aGluZyBzbwo+Pj4gbWF5YmUgd2UgYmV0dGVy
IGRvIGl0IEFTQVAgLi4uIHdoYXQncyB5b3VyIG9waW5pb24/Cj4+Cj4+IFllcywgeW91IGNhbi4K
Pj4KPj4gQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4KPiBBbmQg
c2hvdWxkIEkgaW5jbHVkZQo+Cj4gVGVzdGVkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPgo+Cj4gPwoKClllcy4KClRoYW5rcwoKCj4KPj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
