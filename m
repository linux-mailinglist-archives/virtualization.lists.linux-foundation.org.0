Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E895C9E1
	for <lists.virtualization@lfdr.de>; Tue,  2 Jul 2019 09:19:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6F42E1566;
	Tue,  2 Jul 2019 07:19:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 420511545
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 07:18:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EEDE470D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 07:18:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C61FB5AFE3;
	Tue,  2 Jul 2019 07:18:32 +0000 (UTC)
Received: from [10.72.12.205] (ovpn-12-205.pek2.redhat.com [10.72.12.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89E275C28D;
	Tue,  2 Jul 2019 07:18:27 +0000 (UTC)
Subject: Re: Reminder: 2 open syzbot bugs in vhost subsystem
To: Eric Biggers <ebiggers@kernel.org>
References: <20190702051707.GF23743@sol.localdomain>
	<e2da1124-52c3-84ff-77ce-deb017711138@redhat.com>
	<20190702053223.GA27702@sol.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <984f559f-3cfd-cfa5-c37f-272beb58aae1@redhat.com>
Date: Tue, 2 Jul 2019 15:18:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702053223.GA27702@sol.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 02 Jul 2019 07:18:33 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Hillf Danton <hdanton@sina.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMTkvNy8yIOS4i+WNiDE6MzIsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiBPbiBUdWUsIEp1
bCAwMiwgMjAxOSBhdCAwMToyNDo0M1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IFRpdGxlOiAgICAgICAgICAgICAgSU5GTzogdGFzayBo
dW5nIGluIHZob3N0X2luaXRfZGV2aWNlX2lvdGxiCj4+PiBMYXN0IG9jY3VycmVkOiAgICAgIDEy
NSBkYXlzIGFnbwo+Pj4gUmVwb3J0ZWQ6ICAgICAgICAgICAxNTMgZGF5cyBhZ28KPj4+IEJyYW5j
aGVzOiAgICAgICAgICAgTWFpbmxpbmUgYW5kIG90aGVycwo+Pj4gRGFzaGJvYXJkIGxpbms6ICAg
ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/aWQ9Y2IxZWE4ZGFmMDNhNTk0MmMy
YWIzMTQ2NzkxNDhjZjZlMTI4ZWY1OAo+Pj4gT3JpZ2luYWwgdGhyZWFkOiAgICBodHRwczovL2xr
bWwua2VybmVsLm9yZy9sa21sLzAwMDAwMDAwMDAwMDdlODZmZDA1ODA5NTUzM2ZAZ29vZ2xlLmNv
bS9ULyN1Cj4+Pgo+Pj4gVW5mb3J0dW5hdGVseSwgdGhpcyBidWcgZG9lcyBub3QgaGF2ZSBhIHJl
cHJvZHVjZXIuCj4+Pgo+Pj4gVGhlIG9yaWdpbmFsIHRocmVhZCBmb3IgdGhpcyBidWcgcmVjZWl2
ZWQgMiByZXBsaWVzOyB0aGUgbGFzdCB3YXMgMTUyIGRheXMgYWdvLgo+Pj4KPj4+IElmIHlvdSBm
aXggdGhpcyBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcgdG8gdGhlIGNvbW1pdDoK
Pj4+ICAgICAgIFJlcG9ydGVkLWJ5OiBzeXpib3QrNDBlMjhhOGJkNTlkMTBlZDBjNDJAc3l6a2Fs
bGVyLmFwcHNwb3RtYWlsLmNvbQo+Pj4KPj4+IElmIHlvdSBzZW5kIGFueSBlbWFpbCBvciBwYXRj
aCBmb3IgdGhpcyBidWcsIHBsZWFzZSBjb25zaWRlciByZXBseWluZyB0byB0aGUKPj4+IG9yaWdp
bmFsIHRocmVhZC4gIEZvciB0aGUgZ2l0IHNlbmQtZW1haWwgY29tbWFuZCB0byB1c2UsIG9yIHRp
cHMgb24gaG93IHRvIHJlcGx5Cj4+PiBpZiB0aGUgdGhyZWFkIGlzbid0IGluIHlvdXIgbWFpbGJv
eCwgc2VlIHRoZSAiUmVwbHkgaW5zdHJ1Y3Rpb25zIiBhdAo+Pj4gaHR0cHM6Ly9sa21sLmtlcm5l
bC5vcmcvci8wMDAwMDAwMDAwMDA3ZTg2ZmQwNTgwOTU1MzNmQGdvb2dsZS5jb20KPj4+Cj4+IENh
biBzeXpib3Qgc3RpbGwgcmVwcm9kdWNlIHRoaXMgaXNzdWU/Cj4gQXBwYXJlbnRseSBub3QsIGFz
IGl0IGxhc3Qgb2NjdXJyZWQgMTI1IGRheXMgYWdvLgo+Cj4gVGhhdCBkb2Vzbid0IG5lY2Vzc2Fy
aWx5IG1lYW4gdGhlIGJ1ZyBpc24ndCBzdGlsbCB0aGVyZSwgdGhvdWdoLgo+Cj4gQnV0IGlmIHlv
dSAoYXMgYSBwZXJzb24gZmFtaWxpYXIgd2l0aCB0aGUgY29kZSkgdGhpbmsgaXQncyBubyBsb25n
ZXIgdmFsaWQgb3IKPiBub3QgYWN0aW9uYWJsZSwgeW91IGNhbiBpbnZhbGlkYXRlIGl0Lgo+Cj4g
LSBFcmljCgoKVGhhbmtzIGZvciB0aGUgaGludC4KCkxldCBtZSB0cnkgdG8gaW52YWxpZGF0ZSBp
dCBpbiB0aGUgb3JpZ2luYWwgdGhyZWFkLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
