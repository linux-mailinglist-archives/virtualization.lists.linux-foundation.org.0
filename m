Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF5D6D66
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 04:58:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C84861807;
	Tue, 15 Oct 2019 02:58:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5C9271801
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 02:58:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 104C86C5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 02:58:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E5CB307D84D;
	Tue, 15 Oct 2019 02:58:19 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 239CD60127;
	Tue, 15 Oct 2019 02:58:14 +0000 (UTC)
Subject: Re: [PATCH RFC v4 0/5] vhost: ring format independence
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20191013113940.2863-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6c54460c-d958-78fb-cd6e-eac97cc2c00f@redhat.com>
Date: Tue, 15 Oct 2019 10:58:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191013113940.2863-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 15 Oct 2019 02:58:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMTkvMTAvMTMg5LiL5Y2INzo0MSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IFRo
aXMgYWRkcyBpbmZyYXN0cnVjdHVyZSByZXF1aXJlZCBmb3Igc3VwcG9ydGluZwo+IG11bHRpcGxl
IHJpbmcgZm9ybWF0cy4KPgo+IFRoZSBpZGVhIGlzIGFzIGZvbGxvd3M6IHdlIGNvbnZlcnQgZGVz
Y3JpcHRvcnMgdG8gYW4KPiBpbmRlcGVuZGVudCBmb3JtYXQgZmlyc3QsIGFuZCBwcm9jZXNzIHRo
YXQgY29udmVydGluZyB0bwo+IGlvdiBsYXRlci4KPgo+IFRoZSBwb2ludCBpcyB0aGF0IHdlIGhh
dmUgYSB0aWdodCBsb29wIHRoYXQgZmV0Y2hlcwo+IGRlc2NyaXB0b3JzLCB3aGljaCBpcyBnb29k
IGZvciBjYWNoZSB1dGlsaXphdGlvbi4KPiBUaGlzIHdpbGwgYWxzbyBhbGxvdyBhbGwga2luZCBv
ZiBiYXRjaGluZyB0cmlja3MgLQo+IGUuZy4gaXQgc2VlbXMgcG9zc2libGUgdG8ga2VlcCBTTUFQ
IGRpc2FibGVkIHdoaWxlCj4gd2UgYXJlIGZldGNoaW5nIG11bHRpcGxlIGRlc2NyaXB0b3JzLgo+
Cj4gVGhpcyBzZWVtcyB0byBwZXJmb3JtIGV4YWN0bHkgdGhlIHNhbWUgYXMgdGhlIG9yaWdpbmFs
Cj4gY29kZSBhbHJlYWR5IGJhc2VkIG9uIGEgbWljcm9iZW5jaG1hcmsuCj4gTGlnaHRseSB0ZXN0
ZWQuCj4gTW9yZSB0ZXN0aW5nIHdvdWxkIGJlIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4KPgo+IFRv
IHVzZSBuZXcgY29kZToKPiAJZWNobyAxID4gL3N5cy9tb2R1bGUvdmhvc3RfdGVzdC9wYXJhbWV0
ZXJzL25ld2NvZGUKPiBvcgo+IAllY2hvIDEgPiAvc3lzL21vZHVsZS92aG9zdF9uZXQvcGFyYW1l
dGVycy9uZXdjb2RlCj4KPiBjaGFuZ2VzIGZyb20gdjM6Cj4gICAgICAgICAgLSBmaXhlZCBlcnJv
ciBoYW5kbGluZyBpbiBjYXNlIG9mIGluZGlyZWN0IGRlc2NyaXB0b3JzCj4gICAgICAgICAgLSBh
ZGQgQlVHX09OIHRvIGRldGVjdCBidWZmZXIgb3ZlcmZsb3cgaW4gY2FzZSBvZiBidWdzCj4gICAg
ICAgICAgICAgICAgICBpbiByZXNwb25zZSB0byBjb21tZW50IGJ5IEphc29uIFdhbmcKPiAgICAg
ICAgICAtIG1pbm9yIGNvZGUgdHdlYWtzCj4KPiBDaGFuZ2VzIGZyb20gdjI6Cj4gCS0gZml4ZWQg
aW5kaXJlY3QgZGVzY3JpcHRvciBiYXRjaGluZwo+ICAgICAgICAgICAgICAgICAgcmVwb3J0ZWQg
YnkgSmFzb24gV2FuZwo+Cj4gQ2hhbmdlcyBmcm9tIHYxOgo+IAktIHR5cG8gZml4ZXMKCgpJJ3Zl
IGp1c3QgZG9uZSBzb21lIHF1aWNrIGJlbmNobWFyayB3aXRoIHRlc3RwbWQgKyB2aG9zdF9uZXQg
dHhvbmx5LgoKV2l0aCAyNTYgcXVldWUgc2l6ZSwgbm8gZGlmZmVyZW5jZSBidXQgaW4gMTAyNCBx
dWV1ZSBzaXplIDElIHJlZ3Jlc3Npb24gCm9mIFBQUyB3ZXJlIGZvdW5kLgoKVGhhbmtzCgoKPgo+
Cj4gTWljaGFlbCBTLiBUc2lya2luICg1KToKPiAgICB2aG9zdDogb3B0aW9uIHRvIGZldGNoIGRl
c2NyaXB0b3JzIHRocm91Z2ggYW4gaW5kZXBlbmRlbnQgc3RydWN0Cj4gICAgdmhvc3QvdGVzdDog
YWRkIGFuIG9wdGlvbiB0byB0ZXN0IG5ldyBjb2RlCj4gICAgdmhvc3Q6IGJhdGNoaW5nIGZldGNo
ZXMKPiAgICB2aG9zdC9uZXQ6IGFkZCBhbiBvcHRpb24gdG8gdGVzdCBuZXcgY29kZQo+ICAgIHZo
b3N0OiBsYXN0IGRlc2NyaXB0b3IgbXVzdCBoYXZlIE5FWFQgY2xlYXIKPgo+ICAgZHJpdmVycy92
aG9zdC9uZXQuYyAgIHwgIDMyICsrKystCj4gICBkcml2ZXJzL3Zob3N0L3Rlc3QuYyAgfCAgMTkg
KystCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAzMjggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgMjAgKyst
Cj4gICA0IGZpbGVzIGNoYW5nZWQsIDM4NSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
