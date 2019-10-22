Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A975E0478
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 15:05:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9BDF9105E;
	Tue, 22 Oct 2019 13:05:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9045E1023
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 13:05:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id F09EA822
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571749546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=h8EDQ2xDv2iRosxM/TPsdakVpv4X4Xs1sqfhpQ5531w=;
	b=M1feaTLKIaN/cf1bP2x21p3A6HyXIwr8/ZmvYtBEfrSUhnxDNY5ef4Da3FEfUHlKGKLaE8
	zhbR+4vuSOtlSTY9n7GM342CtvwF+RGBc/sXfZpPRvTG0ePZuarVs4pUjvXp/sxLeOLDJS
	RiwKcQw1rHBhEydm/b3TEYMRHmsmVuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-34-8XCqpx5SOa6XdUdF1AE9Ng-1; Tue, 22 Oct 2019 09:05:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A458476;
	Tue, 22 Oct 2019 13:05:41 +0000 (UTC)
Received: from [10.72.12.23] (ovpn-12-23.pek2.redhat.com [10.72.12.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 372005D6B0;
	Tue, 22 Oct 2019 13:05:32 +0000 (UTC)
Subject: Re: [PATCH] virtio_ring: fix packed ring event may missing
To: "Liu, Yong" <yong.liu@intel.com>, "mst@redhat.com" <mst@redhat.com>,
	"Bie, Tiwei" <tiwei.bie@intel.com>
References: <20191021171004.18729-1-yong.liu@intel.com>
	<78d15397-984d-8679-383d-fb20dc63b449@redhat.com>
	<86228AFD5BCD8E4EBFD2B90117B5E81E633D74EF@SHSMSX103.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f8694d07-609b-5ba5-1960-65d763135e70@redhat.com>
Date: Tue, 22 Oct 2019 21:05:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <86228AFD5BCD8E4EBFD2B90117B5E81E633D74EF@SHSMSX103.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 8XCqpx5SOa6XdUdF1AE9Ng-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

Ck9uIDIwMTkvMTAvMjIg5LiL5Y2IMjo0OCwgTGl1LCBZb25nIHdyb3RlOgo+IEhpIEphc29uLAo+
IE15IGFuc3dlcnMgYXJlIGlubGluZS4KPgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
PiBGcm9tOiBKYXNvbiBXYW5nIFttYWlsdG86amFzb3dhbmdAcmVkaGF0LmNvbV0KPj4gU2VudDog
VHVlc2RheSwgT2N0b2JlciAyMiwgMjAxOSAxMDo0NSBBTQo+PiBUbzogTGl1LCBZb25nIDx5b25n
LmxpdUBpbnRlbC5jb20+OyBtc3RAcmVkaGF0LmNvbTsgQmllLCBUaXdlaQo+PiA8dGl3ZWkuYmll
QGludGVsLmNvbT4KPj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZpcnRpb19yaW5nOiBmaXggcGFja2VkIHJpbmcg
ZXZlbnQgbWF5IG1pc3NpbmcKPj4KPj4KPj4gT24gMjAxOS8xMC8yMiDkuIrljYgxOjEwLCBNYXJ2
aW4gTGl1IHdyb3RlOgo+Pj4gV2hlbiBjYWxsYmFjayBpcyBkZWxheWVkLCB2aXJ0aW8gZXhwZWN0
IHRoYXQgdmhvc3Qgd2lsbCBraWNrIHdoZW4KPj4+IHJvbGxpbmcgb3ZlciBldmVudCBvZmZzZXQu
IFJlY2hlY2sgc2hvdWxkIGJlIHRha2VuIGFzIHVzZWQgaW5kZXggbWF5Cj4+PiBleGNlZWQgZXZl
bnQgb2Zmc2V0IGJldHdlZW4gc3RhdHVzIGNoZWNrIGFuZCBkcml2ZXIgZXZlbnQgdXBkYXRlLgo+
Pj4KPj4+IEhvd2V2ZXIsIGl0IGlzIHBvc3NpYmxlIHRoYXQgZmxhZ3Mgd2FzIG5vdCBtb2RpZmll
ZCBpZiBkZXNjcmlwdG9ycyBhcmUKPj4+IGNoYWluZWQgb3IgaW5fb3JkZXIgZmVhdHVyZSB3YXMg
bmVnb3RpYXRlZC4gU28gZmxhZ3MgYXQgZXZlbnQgb2Zmc2V0Cj4+PiBtYXkgbm90IGJlIHZhbGlk
IGZvciBkZXNjcmlwdG9yJ3Mgc3RhdHVzIGNoZWNraW5nLiBGaXggaXQgYnkgdXNpbmcgbGFzdAo+
Pj4gdXNlZCBpbmRleCBhcyByZXBsYWNlbWVudC4gVHggcXVldWUgd2lsbCBiZSBzdG9wcGVkIGlm
IHRoZXJlJ3Mgbm90Cj4+PiBlbm91Z2ggZnJlZWQgYnVmZmVycyBhZnRlciByZWNoZWNrLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IE1hcnZpbiBMaXUgPHlvbmcubGl1QGludGVsLmNvbT4KPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyBiL2RyaXZlcnMvdmly
dGlvL3ZpcnRpb19yaW5nLmMKPj4+IGluZGV4IGJkYzA4MjQ0YTY0OC4uYTgwNDFlNDUxZTllIDEw
MDY0NAo+Pj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+Pj4gKysrIGIvZHJp
dmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+Pj4gQEAgLTE0OTksOSArMTQ5OSw2IEBAIHN0YXRp
YyBib29sCj4+IHZpcnRxdWV1ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQoc3RydWN0IHZpcnRx
dWV1ZSAqX3ZxKQo+Pj4gICAgCQkgKiBjb3VudGVyIGZpcnN0IGJlZm9yZSB1cGRhdGluZyBldmVu
dCBmbGFncy4KPj4+ICAgIAkJICovCj4+PiAgICAJCXZpcnRpb193bWIodnEtPndlYWtfYmFycmll
cnMpOwo+Pj4gLQl9IGVsc2Ugewo+Pj4gLQkJdXNlZF9pZHggPSB2cS0+bGFzdF91c2VkX2lkeDsK
Pj4+IC0JCXdyYXBfY291bnRlciA9IHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXI7Cj4+PiAg
ICAJfQo+Pj4KPj4+ICAgIAlpZiAodnEtPnBhY2tlZC5ldmVudF9mbGFnc19zaGFkb3cgPT0gVlJJ
TkdfUEFDS0VEX0VWRU5UX0ZMQUdfRElTQUJMRSkKPj4gewo+Pj4gQEAgLTE1MTgsNyArMTUxNSw5
IEBAIHN0YXRpYyBib29sCj4+IHZpcnRxdWV1ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQoc3Ry
dWN0IHZpcnRxdWV1ZSAqX3ZxKQo+Pj4gICAgCSAqLwo+Pj4gICAgCXZpcnRpb19tYih2cS0+d2Vh
a19iYXJyaWVycyk7Cj4+Pgo+Pj4gLQlpZiAoaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwgdXNlZF9p
ZHgsIHdyYXBfY291bnRlcikpIHsKPj4+ICsJaWYgKGlzX3VzZWRfZGVzY19wYWNrZWQodnEsCj4+
PiArCQkJCXZxLT5sYXN0X3VzZWRfaWR4LAo+Pj4gKwkJCQl2cS0+cGFja2VkLnVzZWRfd3JhcF9j
b3VudGVyKSkgewo+Pj4gICAgCQlFTkRfVVNFKHZxKTsKPj4+ICAgIAkJcmV0dXJuIGZhbHNlOwo+
Pj4gICAgCX0KPj4KPj4gSGkgTWFydmluOgo+Pgo+PiBUd28gcXVlc3Rpb25zOgo+Pgo+PiAxKSBE
byB3ZSBzdXBwb3J0IElOX09SREVSIGluIGtlcm5lbCBkcml2ZXI/Cj4+Cj4gTm90IHN1cHBvcnQg
Ynkgbm93LiBCdXQgaXNzdWUgc3RpbGwgY2FuIGJlIHBvc3NpYmxlIGlmIGluX2RpcmVjdCBkaXNh
YmxlZCBhbmQgbWVhbndoaWxlIGRlc2NzIGFyZSBjaGFpbmVkLgo+IER1ZSB0byBwYWNrZWQgcmlu
ZyBkZXNjIHN0YXR1cyBzaG91bGQgY2hlY2sgb25lIGJ5IG9uZSwgY2hvc2UgYXJiaXRyYXJ5IHBv
c2l0aW9uIG1heSBjYXVzZSBpc3N1ZS4KCgpSaWdodCwgdGhlbiBpdCdzIGJldHRlciB0byBtZW50
aW9uIElOX09SREVSIGFzIGZ1dHVyZSBmZWF0dXJlcy4KCgo+Cj4+IDIpIFNob3VsZCB3ZSBjaGVj
ayBJTl9PUkRFUiBpbiB0aGlzIGNhc2Ugb3RoZXJ3aXNlIHdlIG1heSBlbmQgdXAgd2l0aAo+PiBp
bnRlcnJ1cHQgc3Rvcm0gd2hlbiBJTl9PUkRFUiBpcyBub3QgbmVnb3RpYXRlZD8KPiBJbnRlcnJ1
cHQgbnVtYmVyIHdpbGwgbm90IGluY3JlYXNlIGhlcmUsIGV2ZW50IG9mZnNldCB2YWx1ZSBjYWxj
dWxhdGVkIGFzIGJlZm9yZS4KPiBIZXJlIGp1c3QgcmVjaGVjayB3aGV0aGVyIG5ldyB1c2VkIGRl
c2NzIGlzIGVub3VnaCBmb3IgbmV4dCBhcm91bmQgeG1pdC4KPiBJZiBiYWNrZW5kIHdhcyBzbG93
LCBtb3N0IGxpa2VseSBUeCBxdWV1ZSB3aWxsIHNsZWVwIGZvciBhIHdoaWxlIHVudGlsIHVzZWQg
aW5kZXggZ28gb3ZlciBldmVudCBvZmZzZXQuCgoKT2ssIGJ1dCB3aGF0IGlmIHRoZSBiYWNrZW5k
IGlzIGFsbW9zdCBhcyBmYXN0IGFzIGd1ZXN0IGRyaXZlcj8gRS5nIGluIAp2aXJ0aW8tbmV0IHdl
IGhhZDoKCiDCoMKgwqAgaWYgKHNxLT52cS0+bnVtX2ZyZWUgPCAyK01BWF9TS0JfRlJBR1MpIHsK
IMKgwqDCoCDCoMKgwqAgbmV0aWZfc3RvcF9zdWJxdWV1ZShkZXYsIHFudW0pOwogwqDCoMKgIMKg
wqDCoCBpZiAoIXVzZV9uYXBpICYmCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCB1bmxpa2VseSghdmly
dHF1ZXVlX2VuYWJsZV9jYl9kZWxheWVkKHNxLT52cSkpKSB7CiDCoMKgwqAgwqDCoMKgIMKgwqDC
oCAvKiBNb3JlIGp1c3QgZ290IHVzZWQsIGZyZWUgdGhlbSB0aGVuIHJlY2hlY2suICovCiDCoMKg
wqAgwqDCoMKgIMKgwqDCoCBmcmVlX29sZF94bWl0X3NrYnMoc3EsIGZhbHNlKTsKIMKgwqDCoCDC
oMKgwqAgwqDCoMKgIGlmIChzcS0+dnEtPm51bV9mcmVlID49IDIrTUFYX1NLQl9GUkFHUykgewog
wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIG5ldGlmX3N0YXJ0X3N1YnF1ZXVlKGRldiwgcW51
bSk7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgdmlydHF1ZXVlX2Rpc2FibGVfY2Ioc3Et
PnZxKTsKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIH0KIMKgwqDCoCDCoMKgwqAgfQogwqDCoMKgIH0K
Ckkgd29ycnkgdGhhdCB3ZSBtYXkgZW5kIHVwIHdpdGggdG9nZ2xpbmcgcXVldWUgc3RhdGUgaW4g
dGhlIGNhc2UgCihzcS0+dnEtPm51bV9mcmVlIGlzIG5lYXIgMiArIE1BWF9TS0JfRlJBR1MpLgoK
SXQgbG9va3MgdG8gbWUgdGhlIGNvcnJlY3QgdGhpbmcgdG8gaW1wbGVtZW50IGlzIHRvIGNhbGN1
bGF0ZSB0aGUgaGVhZCAKZGVzY3JpcHRvciBvZiBhIGNoYWluIHRoYXQgc2l0cyBhdCAzLzQuCgpU
aGFua3MKCgo+Cj4gVGhhbmtzLAo+IE1hcnZpbgo+Cj4+IFRoYW5rcwo+PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
