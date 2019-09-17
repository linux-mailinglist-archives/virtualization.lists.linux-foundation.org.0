Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE758B453C
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 03:30:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C6E69F84;
	Tue, 17 Sep 2019 01:29:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BC05EF69
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 01:29:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 65EE07DB
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 01:29:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDC728980E8;
	Tue, 17 Sep 2019 01:29:55 +0000 (UTC)
Received: from [10.72.12.121] (ovpn-12-121.pek2.redhat.com [10.72.12.121])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F41F05C1D6;
	Tue, 17 Sep 2019 01:29:44 +0000 (UTC)
Subject: Re: [RFC v4 0/3] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com, maxime.coquelin@redhat.com
References: <20190917010204.30376-1-tiwei.bie@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <980958b0-b541-6e37-830e-f2b82358845b@redhat.com>
Date: Tue, 17 Sep 2019 09:29:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917010204.30376-1-tiwei.bie@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Tue, 17 Sep 2019 01:29:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8xNyDkuIrljYg5OjAyLCBUaXdlaSBCaWUgd3JvdGU6Cj4gVGhpcyBSRkMgaXMg
dG8gZGVtb25zdHJhdGUgYmVsb3cgaWRlYXMsCj4KPiBhKSBCdWlsZCB2aG9zdC1tZGV2IG9uIHRv
cCBvZiB0aGUgc2FtZSBhYnN0cmFjdGlvbiBkZWZpbmVkIGluCj4gICAgIHRoZSB2aXJ0aW8tbWRl
diBzZXJpZXMgWzFdOwo+Cj4gYikgSW50cm9kdWNlIC9kZXYvdmhvc3QtbWRldiB0byBkbyB2aG9z
dCBpb2N0bHMgYW5kIHN1cHBvcnQKPiAgICAgc2V0dGluZyBtZGV2IGRldmljZSBhcyBiYWNrZW5k
Owo+Cj4gTm93IHRoZSB1c2Vyc3BhY2UgQVBJIGxvb2tzIGxpa2UgdGhpczoKPgo+IC0gVXNlcnNw
YWNlIGdlbmVyYXRlcyBhIGNvbXBhdGlibGUgbWRldiBkZXZpY2U7Cj4KPiAtIFVzZXJzcGFjZSBv
cGVucyB0aGlzIG1kZXYgZGV2aWNlIHdpdGggVkZJTyBBUEkgKGluY2x1ZGluZwo+ICAgIGRvaW5n
IElPTU1VIHByb2dyYW1taW5nIGZvciB0aGlzIG1kZXYgZGV2aWNlIHdpdGggVkZJTydzCj4gICAg
Y29udGFpbmVyL2dyb3VwIGJhc2VkIGludGVyZmFjZSk7Cj4KPiAtIFVzZXJzcGFjZSBvcGVucyAv
ZGV2L3Zob3N0LW1kZXYgYW5kIGdldHMgdmhvc3QgZmQ7Cj4KPiAtIFVzZXJzcGFjZSB1c2VzIHZo
b3N0IGlvY3RscyB0byBzZXR1cCB2aG9zdCAodXNlcnNwYWNlIHNob3VsZAo+ICAgIGRvIFZIT1NU
X01ERVZfU0VUX0JBQ0tFTkQgaW9jdGwgd2l0aCBWRklPIGdyb3VwIGZkIGFuZCBkZXZpY2UKPiAg
ICBmZCBmaXJzdCBiZWZvcmUgZG9pbmcgb3RoZXIgdmhvc3QgaW9jdGxzKTsKPgo+IE9ubHkgY29t
cGlsZSB0ZXN0IGhhcyBiZWVuIGRvbmUgZm9yIHRoaXMgc2VyaWVzIGZvciBub3cuCj4KPiBSRkN2
MzogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTExNzc4NS8KPgo+IFsxXSBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS85LzEwLzEzNQoKClRoYW5rcyBhIGxvdCBmb3IgdGhl
IHBhdGNoZXMuCgpQZXIgTWljaGFlbCByZXF1ZXN0LCB0aGUgQVBJIGluIFsxXSBtaWdodCBuZWVk
IHNvbWUgdHdlYWssIEkgd2FudCB0byAKaW50cm9kdWNlIHNvbWUgZGV2aWNlIHNwZWNpZmljIHBh
cmVudF9vcHMgaW5zdGVhZCBvZiB2ZmlvIHNwZWNpZmljIG9uZS4gClRoaXMgUkZDIGhhcyBiZWVu
IHBvc3RlZCBhdCBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS85LzEyLzE1MS4KCgo+Cj4gVGl3
ZWkgQmllICgzKToKPiAgICB2ZmlvOiBzdXBwb3J0IGdldHRpbmcgdmZpbyBkZXZpY2UgZnJvbSBk
ZXZpY2UgZmQKPiAgICB2ZmlvOiBzdXBwb3J0IGNoZWNraW5nIHZmaW8gZHJpdmVyIGJ5IGRldmlj
ZSBvcHMKPiAgICB2aG9zdDogaW50cm9kdWNlIG1kZXYgYmFzZWQgaGFyZHdhcmUgYmFja2VuZAo+
Cj4gICBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICB8ICAgMyArLQo+ICAgZHJpdmVy
cy92ZmlvL3ZmaW8uYyAgICAgICAgICAgICAgfCAgMzIgKysrCj4gICBkcml2ZXJzL3Zob3N0L0tj
b25maWcgICAgICAgICAgICB8ICAgOSArCj4gICBkcml2ZXJzL3Zob3N0L01ha2VmaWxlICAgICAg
ICAgICB8ICAgMyArCj4gICBkcml2ZXJzL3Zob3N0L21kZXYuYyAgICAgICAgICAgICB8IDQ2MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMg
ICAgICAgICAgICB8ICAzOSArKy0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCAgICAgICAgICAg
IHwgICA2ICsKPiAgIGluY2x1ZGUvbGludXgvdmZpby5oICAgICAgICAgICAgIHwgIDExICsKPiAg
IGluY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oICAgICAgIHwgIDEwICsKPiAgIGluY2x1ZGUvdWFw
aS9saW51eC92aG9zdF90eXBlcy5oIHwgICA1ICsKPiAgIDEwIGZpbGVzIGNoYW5nZWQsIDU3MyBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvdmhvc3QvbWRldi5jCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
