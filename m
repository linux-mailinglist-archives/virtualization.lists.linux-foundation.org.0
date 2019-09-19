Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8FB7A29
	for <lists.virtualization@lfdr.de>; Thu, 19 Sep 2019 15:08:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D67C0CD3;
	Thu, 19 Sep 2019 13:08:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A98EEC84
	for <virtualization@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 13:08:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AD364711
	for <virtualization@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 13:08:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2765189810C;
	Thu, 19 Sep 2019 13:08:35 +0000 (UTC)
Received: from [10.72.12.81] (ovpn-12-81.pek2.redhat.com [10.72.12.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABF825D9CC;
	Thu, 19 Sep 2019 13:08:22 +0000 (UTC)
Subject: Re: [RFC v4 0/3] vhost: introduce mdev based hardware backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190917010204.30376-1-tiwei.bie@intel.com>
	<993841ed-942e-c90b-8016-8e7dc76bf13a@redhat.com>
	<20190917105801.GA24855@___>
	<fa6957f3-19ad-f351-8c43-65bc8342b82e@redhat.com>
	<20190918102923-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d2efe7e4-cf13-437d-e2dc-e2779fac7d2f@redhat.com>
Date: Thu, 19 Sep 2019 21:08:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918102923-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Thu, 19 Sep 2019 13:08:35 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8xOCDkuIvljYgxMDozMiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+
IFNvIEkgaGF2ZSBzb21lIHF1ZXN0aW9uczoKPj4+Pgo+Pj4+IDEpIENvbXBhcmVkIHRvIG1ldGhv
ZCAyLCB3aGF0J3MgdGhlIGFkdmFudGFnZSBvZiBjcmVhdGluZyBhIG5ldyB2aG9zdCBjaGFyCj4+
Pj4gZGV2aWNlPyBJIGd1ZXNzIGl0J3MgZm9yIGtlZXAgdGhlIEFQSSBjb21wYXRpYmlsaXR5Pwo+
Pj4gT25lIGJlbmVmaXQgaXMgdGhhdCB3ZSBjYW4gYXZvaWQgZG9pbmcgdmhvc3QgaW9jdGxzIG9u
Cj4+PiBWRklPIGRldmljZSBmZC4KPj4gWWVzLCBidXQgYW55IGJlbmVmaXQgZnJvbSBkb2luZyB0
aGlzPwo+IEl0IGRvZXMgc2VlbSBhIGJpdCBtb3JlIG1vZHVsYXIsIGJ1dCBpdCdzIGNlcnRhaW5s
eSBub3QgYSBiaWcgZGVhbC4KCgpPaywgaWYgd2UgZ28gdGhpcyB3YXksIGl0IGNvdWxkIGJlIGFz
IHNpbXBsZSBhcyBwcm92aWRlIHNvbWUgY2FsbGJhY2sgdG8gCnZob3N0LCB0aGVuIHZob3N0IGNh
biBqdXN0IGZvcndhcmQgdGhlIGlvY3RsIHRocm91Z2ggcGFyZW50X29wcy4KCgo+Cj4+Pj4gMikg
Rm9yIG1ldGhvZCAyLCBpcyB0aGVyZSBhbnkgZWFzeSB3YXkgZm9yIHVzZXIvYWRtaW4gdG8gZGlz
dGluZ3Vpc2ggZS5nCj4+Pj4gb3JkaW5hcnkgdmZpby1tZGV2IGZvciB2aG9zdCBmcm9tIG9yZGlu
YXJ5IHZmaW8tbWRldj8KPj4+IEkgdGhpbmsgZGV2aWNlLWFwaSBjb3VsZCBiZSBhIGNob2ljZS4K
Pj4gT2suCj4+Cj4+Cj4+Pj4gSSBzYXcgeW91IGludHJvZHVjZQo+Pj4+IG9wcyBtYXRjaGluZyBo
ZWxwZXIgYnV0IGl0J3Mgbm90IGZyaWVuZGx5IHRvIG1hbmFnZW1lbnQuCj4+PiBUaGUgb3BzIG1h
dGNoaW5nIGhlbHBlciBpcyBqdXN0IHRvIGNoZWNrIHdoZXRoZXIgYSBnaXZlbgo+Pj4gdmZpby1k
ZXZpY2UgaXMgYmFzZWQgb24gYSBtZGV2IGRldmljZS4KPj4+Cj4+Pj4gMykgQSBkcmF3YmFjayBv
ZiAxKSBhbmQgMikgaXMgdGhhdCBpdCBtdXN0IGZvbGxvdyB2ZmlvX2RldmljZV9vcHMgdGhhdAo+
Pj4+IGFzc3VtZXMgdGhlIHBhcmFtZXRlciBjb21lcyBmcm9tIHVzZXJzcGFjZSwgaXQgcHJldmVu
dHMgc3VwcG9ydCBrZXJuZWwKPj4+PiB2aXJ0aW8gZHJpdmVycy4KPj4+Pgo+Pj4+IDQpIFNvIGNv
bWVzIHRoZSBpZGVhIG9mIG1ldGhvZCAzLCBzaW5jZSBpdCByZWdpc3RlciBhIG5ldyB2aG9zdC1t
ZGV2IGRyaXZlciwKPj4+PiB3ZSBjYW4gdXNlIGRldmljZSBzcGVjaWZpYyBvcHMgaW5zdGVhZCBv
ZiBWRklPIG9uZXMsIHRoZW4gd2UgY2FuIGhhdmUgYQo+Pj4+IGNvbW1vbiBBUEkgYmV0d2VlbiB2
RFBBIHBhcmVudCBhbmQgdmhvc3QtbWRldi92aXJ0aW8tbWRldiBkcml2ZXJzLgo+Pj4gQXMgdGhl
IGFib3ZlIGRyYWZ0IHNob3dzLCB0aGlzIHJlcXVpcmVzIGludHJvZHVjaW5nIGEgbmV3Cj4+PiBW
RklPIGRldmljZSBkcml2ZXIuIEkgdGhpbmsgQWxleCdzIG9waW5pb24gbWF0dGVycyBoZXJlLgoK
Ckp1c3QgdG8gY2xhcmlmeSwgYSBuZXcgdHlwZSBvZiBtZGV2IGRyaXZlciBidXQgcHJvdmlkZXMg
ZHVtbXkgCnZmaW9fZGV2aWNlX29wcyBmb3IgVkZJTyB0byBtYWtlIGNvbnRhaW5lciBETUEgaW9j
dGwgd29yay4KClRoYW5rcwoKCj4+IFllcywgaXQgaXMuCj4+Cj4+IFRoYW5rcwo+Pgo+PgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
