Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E4B4606
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 05:32:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D1747EF9;
	Tue, 17 Sep 2019 03:32:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C3B7DE95
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 03:32:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4594B81A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 03:32:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6592F10CC1E4;
	Tue, 17 Sep 2019 03:32:17 +0000 (UTC)
Received: from [10.72.12.121] (ovpn-12-121.pek2.redhat.com [10.72.12.121])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB54460126;
	Tue, 17 Sep 2019 03:32:05 +0000 (UTC)
Subject: Re: [RFC v4 0/3] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com, maxime.coquelin@redhat.com
References: <20190917010204.30376-1-tiwei.bie@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <993841ed-942e-c90b-8016-8e7dc76bf13a@redhat.com>
Date: Tue, 17 Sep 2019 11:32:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917010204.30376-1-tiwei.bie@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Tue, 17 Sep 2019 03:32:17 +0000 (UTC)
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
cGlsZSB0ZXN0IGhhcyBiZWVuIGRvbmUgZm9yIHRoaXMgc2VyaWVzIGZvciBub3cuCgoKSGF2ZSBh
IGhhcmQgdGhvdWdodCBvbiB0aGUgYXJjaGl0ZWN0dXJlOgoKMSkgQ3JlYXRlIGEgdmhvc3QgY2hh
ciBkZXZpY2UgYW5kIHBhc3MgdmZpbyBtZGV2IGRldmljZSBmZCB0byBpdCBhcyBhIApiYWNrZW5k
IGFuZCB0cmFuc2xhdGUgdmhvc3QtbWRldiBpb2N0bCB0byB2aXJ0aW8gbWRldiB0cmFuc3BvcnQg
KGUuZyAKcmVhZC93cml0ZSkuIERNQSB3YXMgZG9uZSB0aHJvdWdoIHRoZSBWRklPIERNQSBtYXBw
aW5nIG9uIHRoZSBjb250YWluZXIgCnRoYXQgaXMgYXR0YWNoZWQuCgpXZSBoYXZlIHR3byBtb3Jl
IGNob2ljZXM6CgoyKSBVc2UgdmZpby1tZGV2IGJ1dCBkbyBub3QgY3JlYXRlIHZob3N0LW1kZXYg
ZGV2aWNlLCBpbnN0ZWFkLCBqdXN0IAppbXBsZW1lbnQgdmhvc3QgaW9jdGwgb24gdmZpb19kZXZp
Y2Vfb3BzLCBhbmQgdHJhbnNsYXRlIHRoZW0gaW50byAKdmlydGlvLW1kZXYgdHJhbnNwb3J0IG9y
IGp1c3QgcGFzcyBpb2N0bCB0byBwYXJlbnQuCgozKSBEb24ndCB1c2UgdmZpby1tZGV2LCBjcmVh
dGUgYSBuZXcgdmhvc3QtbWRldiBkcml2ZXIsIGR1cmluZyBwcm9iZSAKc3RpbGwgdHJ5IHRvIGFk
ZCBkZXYgdG8gdmZpbyBncm91cCBhbmQgdGFsayB0byBwYXJlbnQgd2l0aCBkZXZpY2UgCnNwZWNp
ZmljIG9wcwoKU28gSSBoYXZlIHNvbWUgcXVlc3Rpb25zOgoKMSkgQ29tcGFyZWQgdG8gbWV0aG9k
IDIsIHdoYXQncyB0aGUgYWR2YW50YWdlIG9mIGNyZWF0aW5nIGEgbmV3IHZob3N0IApjaGFyIGRl
dmljZT8gSSBndWVzcyBpdCdzIGZvciBrZWVwIHRoZSBBUEkgY29tcGF0aWJpbGl0eT8KCjIpIEZv
ciBtZXRob2QgMiwgaXMgdGhlcmUgYW55IGVhc3kgd2F5IGZvciB1c2VyL2FkbWluIHRvIGRpc3Rp
bmd1aXNoIGUuZyAKb3JkaW5hcnkgdmZpby1tZGV2IGZvciB2aG9zdCBmcm9tIG9yZGluYXJ5IHZm
aW8tbWRldj/CoCBJIHNhdyB5b3UgCmludHJvZHVjZSBvcHMgbWF0Y2hpbmcgaGVscGVyIGJ1dCBp
dCdzIG5vdCBmcmllbmRseSB0byBtYW5hZ2VtZW50LgoKMykgQSBkcmF3YmFjayBvZiAxKSBhbmQg
MikgaXMgdGhhdCBpdCBtdXN0IGZvbGxvdyB2ZmlvX2RldmljZV9vcHMgdGhhdCAKYXNzdW1lcyB0
aGUgcGFyYW1ldGVyIGNvbWVzIGZyb20gdXNlcnNwYWNlLCBpdCBwcmV2ZW50cyBzdXBwb3J0IGtl
cm5lbCAKdmlydGlvIGRyaXZlcnMuCgo0KSBTbyBjb21lcyB0aGUgaWRlYSBvZiBtZXRob2QgMywg
c2luY2UgaXQgcmVnaXN0ZXIgYSBuZXcgdmhvc3QtbWRldiAKZHJpdmVyLCB3ZSBjYW4gdXNlIGRl
dmljZSBzcGVjaWZpYyBvcHMgaW5zdGVhZCBvZiBWRklPIG9uZXMsIHRoZW4gd2UgY2FuIApoYXZl
IGEgY29tbW9uIEFQSSBiZXR3ZWVuIHZEUEEgcGFyZW50IGFuZCB2aG9zdC1tZGV2L3ZpcnRpby1t
ZGV2IGRyaXZlcnMuCgpXaGF0J3MgeW91ciB0aG91Z2h0cz8KClRoYW5rcwoKCj4KPiBSRkN2Mzog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTExNzc4NS8KPgo+IFsxXSBodHRw
czovL2xrbWwub3JnL2xrbWwvMjAxOS85LzEwLzEzNQo+Cj4gVGl3ZWkgQmllICgzKToKPiAgICB2
ZmlvOiBzdXBwb3J0IGdldHRpbmcgdmZpbyBkZXZpY2UgZnJvbSBkZXZpY2UgZmQKPiAgICB2Zmlv
OiBzdXBwb3J0IGNoZWNraW5nIHZmaW8gZHJpdmVyIGJ5IGRldmljZSBvcHMKPiAgICB2aG9zdDog
aW50cm9kdWNlIG1kZXYgYmFzZWQgaGFyZHdhcmUgYmFja2VuZAo+Cj4gICBkcml2ZXJzL3ZmaW8v
bWRldi92ZmlvX21kZXYuYyAgICB8ICAgMyArLQo+ICAgZHJpdmVycy92ZmlvL3ZmaW8uYyAgICAg
ICAgICAgICAgfCAgMzIgKysrCj4gICBkcml2ZXJzL3Zob3N0L0tjb25maWcgICAgICAgICAgICB8
ICAgOSArCj4gICBkcml2ZXJzL3Zob3N0L01ha2VmaWxlICAgICAgICAgICB8ICAgMyArCj4gICBk
cml2ZXJzL3Zob3N0L21kZXYuYyAgICAgICAgICAgICB8IDQ2MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgICAgICAgICAgICB8ICAzOSAr
Ky0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCAgICAgICAgICAgIHwgICA2ICsKPiAgIGluY2x1
ZGUvbGludXgvdmZpby5oICAgICAgICAgICAgIHwgIDExICsKPiAgIGluY2x1ZGUvdWFwaS9saW51
eC92aG9zdC5oICAgICAgIHwgIDEwICsKPiAgIGluY2x1ZGUvdWFwaS9saW51eC92aG9zdF90eXBl
cy5oIHwgICA1ICsKPiAgIDEwIGZpbGVzIGNoYW5nZWQsIDU3MyBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmhvc3QvbWRldi5jCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
