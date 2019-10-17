Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A49DA389
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 04:17:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B023CB5F;
	Thu, 17 Oct 2019 02:17:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C4C0B59
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 02:17:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3054B6C5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 02:17:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C5704ACA7;
	Thu, 17 Oct 2019 02:17:33 +0000 (UTC)
Received: from [10.72.12.185] (ovpn-12-185.pek2.redhat.com [10.72.12.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 420531001B33;
	Thu, 17 Oct 2019 02:17:19 +0000 (UTC)
Subject: Re: read_barrier_depends() usage in vhost.c
To: Will Deacon <will@kernel.org>, mst@redhat.com
References: <20191016233340.djrr7o7dwueqccac@willie-the-truck>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2429dbbc-ec80-3a76-82ff-481c0523f68a@redhat.com>
Date: Thu, 17 Oct 2019 10:17:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191016233340.djrr7o7dwueqccac@willie-the-truck>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 17 Oct 2019 02:17:33 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: peterz@infradead.org, linux-kernel@lists.infradead.org,
	stern@rowland.harvard.edu, paulmck@kernel.org,
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

Ck9uIDIwMTkvMTAvMTcg5LiK5Y2INzozMywgV2lsbCBEZWFjb24gd3JvdGU6Cj4gSGkgYWxsLAo+
Cj4gSW4gYW4gYXR0ZW1wdCB0byByZW1vdmUgdGhlIHJlbWFpbmluZyB0cmFjZXMgb2YgW3NtcF9d
cmVhZF9iYXJyaWVyX2RlcGVuZHMoKQo+IGZvbGxvd2luZyBteSBwcmV2aW91cyBwYXRjaGVzIHRv
IHN0cmVuZ3RoZW4gUkVBRF9PTkNFKCkgZm9yIEFscGhhIFsxXSwgSQo+IGVuZGVkIHVwIHRyeWlu
ZyB0byBkZWNpcGhlciB0aGUgcmVhZF9iYXJyaWVyX2RlcGVuZHMoKSB1c2FnZSBpbiB0aGUgdmhv
c3QKPiBkcml2ZXI6Cj4KPiAtLS0+OAo+Cj4gLy8gZHJpdmVycy92aG9zdC92aG9zdC5jCj4gc3Rh
dGljIGludCBnZXRfaW5kaXJlY3Qoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gCQkJc3Ry
dWN0IGlvdmVjIGlvdltdLCB1bnNpZ25lZCBpbnQgaW92X3NpemUsCj4gCQkJdW5zaWduZWQgaW50
ICpvdXRfbnVtLCB1bnNpZ25lZCBpbnQgKmluX251bSwKPiAJCQlzdHJ1Y3Qgdmhvc3RfbG9nICps
b2csIHVuc2lnbmVkIGludCAqbG9nX251bSwKPiAJCQlzdHJ1Y3QgdnJpbmdfZGVzYyAqaW5kaXJl
Y3QpCj4gewo+IAlbLi4uXQo+Cj4gCS8qIFdlIHdpbGwgdXNlIHRoZSByZXN1bHQgYXMgYW4gYWRk
cmVzcyB0byByZWFkIGZyb20sIHNvIG1vc3QKPiAJICogYXJjaGl0ZWN0dXJlcyBvbmx5IG5lZWQg
YSBjb21waWxlciBiYXJyaWVyIGhlcmUuICovCj4gCXJlYWRfYmFycmllcl9kZXBlbmRzKCk7Cj4K
PiAtLS0+OAo+Cj4gVW5mb3J0dW5hdGVseSwgYWx0aG91Z2ggdGhlIGJhcnJpZXIgaXMgY29tbWVu
dGVkIChodXJyYWghKSwgaXQncyBub3QKPiBwYXJ0aWN1bGFybHkgZW5saWdodGVuaW5nIGFib3V0
IHRoZSBhY2Nlc3NlcyBtYWtpbmcgdXAgdGhlIGRlcGVuZGVuY3kKPiBjaGFpbiwgYW5kIEkgZG9u
J3QgdW5kZXJzdGFuZCB0aGUgc3VwcG9zZWQgbmVlZCBmb3IgYSBjb21waWxlciBiYXJyaWVyCj4g
ZWl0aGVyIChyZWFkX2JhcnJpZXJfZGVwZW5kcygpIGRvZXNuJ3QgZ2VuZXJhbGx5IHByb3ZpZGUg
dGhpcykuCj4KPiBEb2VzIGFueWJvZHkga25vdyB3aGljaCBhY2Nlc3NlcyBhcmUgYmVpbmcgb3Jk
ZXJlZCBoZXJlPyBVc3VhbGx5IHlvdSdkIG5lZWQKPiBhIFJFQURfT05DRSgpL3JjdV9kZXJlZmVy
ZW5jZSgpIGJlZ2lubmluZyB0aGUgY2hhaW4sIGJ1dCBJIGhhdmVuJ3QgbWFuYWdlZAo+IHRvIGZp
bmQgb25lLi4uCj4KPiBUaGFua3MsCgoKSSBndWVzcyBpdCB3YXMgYmVjYXVzZSB3ZSB3aWxsIHJl
YWQgZnJvbSB0aGUgYWRkcmVzcyBzdG9yZWQgaW4gdGhlIGlvdiBsaWtlOgoKMSkgdHJhc25sYXRl
X2Rlc2MoKSB0aGF0IHN0b3JlcyB0aGUgdXNlcnNwYWNlIGJ1ZmZlciBwb2ludGVyIGluIHRoZSBp
b3YKCjIpIGNvcHlfZnJvbV9pdGVyKCkgdGhhdCByZWFkcyBmcm9tIHRob3NlIHBvaW50ZXJzCgpT
byB3ZSBuZWVkIGEgZGF0YSBkZXBlbmRlbmN5IGJhcnJpZXIgaW4gdGhlIG1pZGRsZSBhcyBleHBs
YWluZWQgaW4gdGhlIAptZW1vcnktYmFycmllcnMudHh0PyAoc2luY2UgUkVBRF9PTkNFIGlzIG5v
dCB1c2VkIGluIGlvdiBpdGVyYXRvcikuCgoKVGhhbmtzCgo+Cj4gV2lsbAo+Cj4gWzFdIGMyYmM2
NjA4MmUxMCAoImxvY2tpbmcvYmFycmllcnM6IEFkZCBpbXBsaWNpdCBzbXBfcmVhZF9iYXJyaWVy
X2RlcGVuZHMoKSB0byBSRUFEX09OQ0UoKSIpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
