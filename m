Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F235B8111A
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 06:39:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5331AC7F;
	Mon,  5 Aug 2019 04:39:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D2C84AF7
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:39:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 60BB05E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:39:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D37428110A;
	Mon,  5 Aug 2019 04:39:40 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34BC819C59;
	Mon,  5 Aug 2019 04:39:35 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<20190802172418.GB11245@ziepe.ca>
	<20190803172944-mutt-send-email-mst@kernel.org>
	<20190804001400.GA25543@ziepe.ca>
	<20190804040034-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8e0812e4-f618-8a9c-38ce-d45f6c897c52@redhat.com>
Date: Mon, 5 Aug 2019 12:39:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190804040034-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 05 Aug 2019 04:39:40 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvOC80IOS4i+WNiDQ6MDcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBT
YXQsIEF1ZyAwMywgMjAxOSBhdCAwOToxNDowMFBNIC0wMzAwLCBKYXNvbiBHdW50aG9ycGUgd3Jv
dGU6Cj4+IE9uIFNhdCwgQXVnIDAzLCAyMDE5IGF0IDA1OjM2OjEzUE0gLTA0MDAsIE1pY2hhZWwg
Uy4gVHNpcmtpbiB3cm90ZToKPj4+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDAyOjI0OjE4UE0g
LTAzMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBh
dCAxMDoyNzoyMUFNIC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+Pj4+IE9uIEZy
aSwgQXVnIDAyLCAyMDE5IGF0IDA5OjQ2OjEzQU0gLTAzMDAsIEphc29uIEd1bnRob3JwZSB3cm90
ZToKPj4+Pj4+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDA1OjQwOjA3UE0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4+Pj4+Pj4+IFRoaXMgbXVzdCBiZSBhIHByb3BlciBiYXJyaWVyLCBsaWtl
IGEgc3BpbmxvY2ssIG11dGV4LCBvcgo+Pj4+Pj4+PiBzeW5jaHJvbml6ZV9yY3UuCj4+Pj4+Pj4K
Pj4+Pj4+PiBJIHN0YXJ0IHdpdGggc3luY2hyb25pemVfcmN1KCkgYnV0IGJvdGggeW91IGFuZCBN
aWNoYWVsIHJhaXNlIHNvbWUKPj4+Pj4+PiBjb25jZXJuLgo+Pj4+Pj4gSSd2ZSBhbHNvIGlkbHkg
d29uZGVyZWQgaWYgY2FsbGluZyBzeW5jaHJvbml6ZV9yY3UoKSB1bmRlciB0aGUgdmFyaW91cwo+
Pj4+Pj4gbW0gbG9ja3MgaXMgYSBkZWFkbG9jayBzaXR1YXRpb24uCj4+Pj4+Pgo+Pj4+Pj4+IFRo
ZW4gSSB0cnkgc3BpbmxvY2sgYW5kIG11dGV4Ogo+Pj4+Pj4+Cj4+Pj4+Pj4gMSkgc3BpbmxvY2s6
IGFkZCBsb3RzIG9mIG92ZXJoZWFkIG9uIGRhdGFwYXRoLCB0aGlzIGxlYWRzIDAgcGVyZm9ybWFu
Y2UKPj4+Pj4+PiBpbXByb3ZlbWVudC4KPj4+Pj4+IEkgdGhpbmsgdGhlIHRvcGljIGhlcmUgaXMg
Y29ycmVjdG5lc3Mgbm90IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50Cj4+Pj4+IFRoZSB0b3BpYyBp
cyB3aGV0aGVyIHdlIHNob3VsZCByZXZlcnQKPj4+Pj4gY29tbWl0IDdmNDY2MDMyZGM5ICgidmhv
c3Q6IGFjY2VzcyB2cSBtZXRhZGF0YSB0aHJvdWdoIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3MiKQo+
Pj4+Pgo+Pj4+PiBvciBrZWVwIGl0IGluLiBUaGUgb25seSByZWFzb24gdG8ga2VlcCBpdCBpcyBw
ZXJmb3JtYW5jZS4KPj4+PiBZaWtlcywgSSdtIG5vdCBzdXJlIHlvdSBjYW4gZXZlciB3aW4gYWdh
aW5zdCBjb3B5X2Zyb21fdXNlciB1c2luZwo+Pj4+IG1tdV9ub3RpZmllcnM/Cj4+PiBFdmVyIHNp
bmNlIGNvcHlfZnJvbV91c2VyIHN0YXJ0ZWQgcGxheWluZyB3aXRoIGZsYWdzIChmb3IgU01BUCkg
YW5kCj4+PiBhZGRlZCBzcGVjdWxhdGlvbiBiYXJyaWVycyB0aGVyZSdzIGEgY2hhbmNlIHdlIGNh
biB3aW4gYnkgYWNjZXNzaW5nCj4+PiBtZW1vcnkgdGhyb3VnaCB0aGUga2VybmVsIGFkZHJlc3Mu
Cj4+IFlvdSB0aGluayBjb3B5X3RvX3VzZXIgd2lsbCBiZSBtb3JlIGV4cGVuc2l2ZSB0aGFuIHRo
ZSBtaW5pbXVtIHR3bwo+PiBhdG9taWNzIHJlcXVpcmVkIHRvIHN5bmNocm9uaXplIHdpdGggYW5v
dGhlciB0aHJlYWQ/Cj4gSSBmcmFua2x5IGRvbid0IGtub3cuIFdpdGggU01BUCB5b3UgZmxpcCBm
bGFncyB0d2ljZSwgYW5kIHdpdGggc3BlY3RyZQo+IHlvdSBmbHVzaCB0aGUgcGlwZWxpbmUuIElz
IHRoYXQgY2hlYXBlciBvciBtb3JlIGV4cGVuc2l2ZSB0aGFuIGFuIGF0b21pYwo+IG9wZXJhdGlv
bj8gVGVzdGluZyBpcyB0aGUgb25seSB3YXkgdG8gdGVsbC4KCgpMZXQgbWUgdGVzdCwgSSBvbmx5
IGRpZCB0ZXN0IG9uIGEgbm9uIFNNQVAgbWFjaGluZS4gU3dpdGNoaW5nIHRvIApzcGlubG9jayBr
aWxscyBhbGwgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQuCgpUaGFua3MKCgo+Cj4+Pj4gQWxzbywg
d2h5IGNhbid0IHRoaXMganVzdCBwZXJtYW5lbnRseSBHVVAgdGhlIHBhZ2VzPyBJbiBmYWN0LCB3
aGVyZQo+Pj4+IGRvZXMgaXQgcHV0X3BhZ2UgdGhlbSBhbnlob3c/IFdvcnJ5aW5nIHRoYXQgN2Y0
NjYgYWRkcyBhIGdldF91c2VyIHBhZ2UKPj4+PiBidXQgZG9lcyBub3QgYWRkIGEgcHV0X3BhZ2U/
Pwo+PiBZb3UgZGlkbid0IGFuc3dlciB0aGlzLi4gV2h5IG5vdCBqdXN0IHVzZSBHVVA/Cj4+Cj4+
IEphc29uCj4gU29ycnkgSSBtaXN1bmRlcnN0b29kIHRoZSBxdWVzdGlvbi4gUGVybWFuZW50IEdV
UCBicmVha3MgbG90cyBvZgo+IGZ1bmN0aW9uYWxpdHkgd2UgbmVlZCBzdWNoIGFzIFRIUCBhbmQg
bnVtYSBiYWxhbmNpbmcuCj4KPiByZWxlYXNlX3BhZ2VzIGlzIHVzZWQgaW5zdGVhZCBvZiBwdXRf
cGFnZS4KPgo+Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
