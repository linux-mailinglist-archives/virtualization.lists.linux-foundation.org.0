Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ADA7C3D2
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 15:41:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B4543C7B;
	Wed, 31 Jul 2019 13:41:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B98293C3C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 13:29:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FE2B6CE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 13:29:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F304781F13;
	Wed, 31 Jul 2019 13:29:36 +0000 (UTC)
Received: from [10.72.12.118] (ovpn-12-118.pek2.redhat.com [10.72.12.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B5E35C1B5;
	Wed, 31 Jul 2019 13:29:29 +0000 (UTC)
Subject: Re: [PATCH V2 4/9] vhost: reset invalidate_count in
	vhost_set_vring_num_addr()
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-5-jasowang@redhat.com>
	<20190731124124.GD3946@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <31ef9ed4-d74a-3454-a57d-fa843a3a802b@redhat.com>
Date: Wed, 31 Jul 2019 21:29:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731124124.GD3946@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 31 Jul 2019 13:29:37 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

Ck9uIDIwMTkvNy8zMSDkuIvljYg4OjQxLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMzEsIDIwMTkgYXQgMDQ6NDY6NTBBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
VGhlIHZob3N0X3NldF92cmluZ19udW1fYWRkcigpIGNvdWxkIGJlIGNhbGxlZCBpbiB0aGUgbWlk
ZGxlIG9mCj4+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBhbmQgaW52YWxpZGF0ZV9yYW5nZV9l
bmQoKS4gSWYgd2UgZG9uJ3QgcmVzZXQKPj4gaW52YWxpZGF0ZV9jb3VudCBhZnRlciB0aGUgdW4t
cmVnaXN0ZXJpbmcgb2YgTU1VIG5vdGlmaWVyLCB0aGUKPj4gaW52YWxpZGF0ZV9jb250IHdpbGwg
cnVuIG91dCBvZiBzeW5jIChlLmcgbmV2ZXIgcmVhY2ggemVybykuIFRoaXMgd2lsbAo+PiBpbiBm
YWN0IGRpc2FibGUgdGhlIGZhc3QgYWNjZXNzb3IgcGF0aC4gRml4aW5nIGJ5IHJlc2V0IHRoZSBj
b3VudCB0bwo+PiB6ZXJvLgo+Pgo+PiBSZXBvcnRlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT4KPiBEaWQgTWljaGFlbCByZXBvcnQgdGhpcyBhcyB3ZWxsPwoKCkNvcnJl
Y3QgbWUgaWYgSSB3YXMgd3JvbmcuIEkgdGhpbmsgaXQncyBwb2ludCA0IGRlc2NyaWJlZCBpbiAK
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNy8yMS8yNS4KClRoYW5rcwoKCj4KPj4gRml4ZXM6
IDdmNDY2MDMyZGM5ZSAoInZob3N0OiBhY2Nlc3MgdnEgbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwg
dmlydHVhbCBhZGRyZXNzIikKPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4KPj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA0ICsrKysKPj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zo
b3N0L3Zob3N0LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gaW5kZXggMmEzMTU0OTc2Mjc3
Li4yYTcyMTdjMzM2NjggMTAwNjQ0Cj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+PiBA
QCAtMjA3Myw2ICsyMDczLDEwIEBAIHN0YXRpYyBsb25nIHZob3N0X3ZyaW5nX3NldF9udW1fYWRk
cihzdHJ1Y3Qgdmhvc3RfZGV2ICpkLAo+PiAgIAkJZC0+aGFzX25vdGlmaWVyID0gZmFsc2U7Cj4+
ICAgCX0KPj4gICAKPj4gKwkvKiByZXNldCBpbnZhbGlkYXRlX2NvdW50IGluIGNhc2Ugd2UgYXJl
IGluIHRoZSBtaWRkbGUgb2YKPj4gKwkgKiBpbnZhbGlkYXRlX3N0YXJ0KCkgYW5kIGludmFsaWRh
dGVfZW5kKCkuCj4+ICsJICovCj4+ICsJdnEtPmludmFsaWRhdGVfY291bnQgPSAwOwo+PiAgIAl2
aG9zdF91bmluaXRfdnFfbWFwcyh2cSk7Cj4+ICAgI2VuZGlmCj4+ICAgCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
