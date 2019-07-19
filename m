Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8986E2E4
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 10:51:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 14407240D;
	Fri, 19 Jul 2019 08:51:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0BD0C1E56
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A967FE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:51:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEFDB2EED01;
	Fri, 19 Jul 2019 08:51:16 +0000 (UTC)
Received: from [10.72.12.179] (ovpn-12-179.pek2.redhat.com [10.72.12.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29D6C5C57A;
	Fri, 19 Jul 2019 08:51:01 +0000 (UTC)
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
	<20190717105336-mutt-send-email-mst@kernel.org>
	<CAGxU2F45v40qAOHkm1Hk2E69gCS0UwVgS5NS+tDXXuzdF4EixA@mail.gmail.com>
	<20190718041234-mutt-send-email-mst@kernel.org>
	<CAGxU2F6oo7Cou7t9o=gG2=wxHMKX9xYQXNxVtDYeHq5fyEhJWg@mail.gmail.com>
	<20190718072741-mutt-send-email-mst@kernel.org>
	<20190719080832.7hoeus23zjyrx3cc@steredhat>
	<fcd19719-e5a9-adad-1e6c-c84487187088@redhat.com>
	<20190719083920.67qo2umpthz454be@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <53da84b9-184f-1377-0582-ab7cf42ebdb6@redhat.com>
Date: Fri, 19 Jul 2019 16:51:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719083920.67qo2umpthz454be@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 19 Jul 2019 08:51:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

Ck9uIDIwMTkvNy8xOSDkuIvljYg0OjM5LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gT24g
RnJpLCBKdWwgMTksIDIwMTkgYXQgMDQ6MjE6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS83LzE5IOS4i+WNiDQ6MDgsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4+
IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDA3OjM1OjQ2QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNp
cmtpbiB3cm90ZToKPj4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAxMTozNzozMEFNICswMjAw
LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0
IDEwOjEzIEFNIE1pY2hhZWwgUy4gVHNpcmtpbjxtc3RAcmVkaGF0LmNvbT4gIHdyb3RlOgo+Pj4+
Pj4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDk6NTA6MTRBTSArMDIwMCwgU3RlZmFubyBHYXJ6
YXJlbGxhIHdyb3RlOgo+Pj4+Pj4+IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDQ6NTUgUE0gTWlj
aGFlbCBTLiBUc2lya2luPG1zdEByZWRoYXQuY29tPiAgd3JvdGU6Cj4+Pj4+Pj4+IE9uIFdlZCwg
SnVsIDE3LCAyMDE5IGF0IDAxOjMwOjI5UE0gKzAyMDAsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90
ZToKPj4+Pj4+Pj4+IElmIHRoZSBwYWNrZXRzIHRvIHNlbnQgdG8gdGhlIGd1ZXN0IGFyZSBiaWdn
ZXIgdGhhbiB0aGUgYnVmZmVyCj4+Pj4+Pj4+PiBhdmFpbGFibGUsIHdlIGNhbiBzcGxpdCB0aGVt
LCB1c2luZyBtdWx0aXBsZSBidWZmZXJzIGFuZCBmaXhpbmcKPj4+Pj4+Pj4+IHRoZSBsZW5ndGgg
aW4gdGhlIHBhY2tldCBoZWFkZXIuCj4+Pj4+Pj4+PiBUaGlzIGlzIHNhZmUgc2luY2UgdmlydGlv
LXZzb2NrIHN1cHBvcnRzIG9ubHkgc3RyZWFtIHNvY2tldHMuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxhPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4+
Pj4+Pj4+IFNvIGhvdyBkb2VzIGl0IHdvcmsgcmlnaHQgbm93PyBJZiBhbiBhcHAKPj4+Pj4+Pj4g
ZG9lcyBzZW5kbXNnIHdpdGggYSA2NEsgYnVmZmVyIGFuZCB0aGUgb3RoZXIKPj4+Pj4+Pj4gc2lk
ZSBwdWJsaXNoZXMgNEsgYnVmZmVycyAtIGRvZXMgaXQganVzdCBzdGFsbD8KPj4+Pj4+PiBCZWZv
cmUgdGhpcyBzZXJpZXMsIHRoZSA2NEsgKG9yIGJpZ2dlcikgdXNlciBtZXNzYWdlcyB3YXMgc3Bs
aXQgaW4gNEsgcGFja2V0cwo+Pj4+Pj4+IChmaXhlZCBpbiB0aGUgY29kZSkgYW5kIHF1ZXVlZCBp
biBhbiBpbnRlcm5hbCBsaXN0IGZvciB0aGUgVFggd29ya2VyLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQWZ0
ZXIgdGhpcyBzZXJpZXMsIHdlIHdpbGwgcXVldWUgdXAgdG8gNjRLIHBhY2tldHMgYW5kIHRoZW4g
aXQgd2lsbCBiZSBzcGxpdCBpbgo+Pj4+Pj4+IHRoZSBUWCB3b3JrZXIsIGRlcGVuZGluZyBvbiB0
aGUgc2l6ZSBvZiB0aGUgYnVmZmVycyBhdmFpbGFibGUgaW4gdGhlCj4+Pj4+Pj4gdnJpbmcuIChU
aGUgaWRlYSB3YXMgdG8gYWxsb3cgRVdNQSBvciBhIGNvbmZpZ3VyYXRpb24gb2YgdGhlIGJ1ZmZl
cnMgc2l6ZSwgYnV0Cj4+Pj4+Pj4gZm9yIG5vdyB3ZSBwb3N0cG9uZWQgaXQpCj4+Pj4+PiBHb3Qg
aXQuIFVzaW5nIHdvcmtlcnMgZm9yIHhtaXQgaXMgSU1ITyBhIGJhZCBpZGVhIGJ0dy4KPj4+Pj4+
IFdoeSBpcyBpdCBkb25lIGxpa2UgdGhpcz8KPj4+Pj4gSG9uZXN0bHksIEkgZG9uJ3Qga25vdyB0
aGUgZXhhY3QgcmVhc29ucyBmb3IgdGhpcyBkZXNpZ24sIGJ1dCBJIHN1cHBvc2UKPj4+Pj4gdGhh
dCB0aGUgaWRlYSB3YXMgdG8gaGF2ZSBvbmx5IG9uZSB3b3JrZXIgdGhhdCB1c2VzIHRoZSB2cmlu
ZywgYW5kCj4+Pj4+IG11bHRpcGxlIHVzZXIgdGhyZWFkcyB0aGF0IGVucXVldWUgcGFja2V0cyBp
biB0aGUgbGlzdC4KPj4+Pj4gVGhpcyBjYW4gc2ltcGxpZnkgdGhlIGNvZGUgYW5kIHdlIGNhbiBw
dXQgdGhlIHVzZXIgdGhyZWFkcyB0byBzbGVlcCBpZgo+Pj4+PiB3ZSBkb24ndCBoYXZlICJjcmVk
aXQiIGF2YWlsYWJsZSAodGhpcyBtZWFucyB0aGF0IHRoZSByZWNlaXZlciBkb2Vzbid0Cj4+Pj4+
IGhhdmUgc3BhY2UgdG8gcmVjZWl2ZSB0aGUgcGFja2V0KS4KPj4+PiBJIHRoaW5rIHlvdSBtZWFu
IHRoZSByZXZlcnNlOiBldmVuIHdpdGhvdXQgY3JlZGl0cyB5b3UgY2FuIGNvcHkgZnJvbQo+Pj4+
IHVzZXIgYW5kIHF1ZXVlIHVwIGRhdGEsIHRoZW4gcHJvY2VzcyBpdCB3aXRob3V0IHdha2luZyB1
cCB0aGUgdXNlcgo+Pj4+IHRocmVhZC4KPj4+IEkgY2hlY2tlZCB0aGUgY29kZSBiZXR0ZXIsIGJ1
dCBpdCBkb2Vzbid0IHNlZW0gdG8gZG8gdGhhdC4KPj4+IFRoZSAuc2VuZG1zZyBjYWxsYmFjayBv
ZiBhZl92c29jaywgY2hlY2sgaWYgdGhlIHRyYW5zcG9ydCBoYXMgc3BhY2UKPj4+ICh2aXJ0aW8t
dnNvY2sgdHJhbnNwb3J0IHJldHVybnMgdGhlIGNyZWRpdCBhdmFpbGFibGUpLiBJZiB0aGVyZSBp
cyBubwo+Pj4gc3BhY2UsIGl0IHB1dCB0aGUgdGhyZWFkIHRvIHNsZWVwIG9uIHRoZSAnc2tfc2xl
ZXAoc2spJyB3YWl0X3F1ZXVlLgo+Pj4KPj4+IFdoZW4gdGhlIHRyYW5zcG9ydCByZWNlaXZlcyBh
biB1cGRhdGUgb2YgY3JlZGl0IGF2YWlsYWJsZSBvbiB0aGUgb3RoZXIKPj4+IHBlZXIsIGl0IGNh
bGxzICdzay0+c2tfd3JpdGVfc3BhY2Uoc2spJyB0aGF0IHdha2VzIHVwIHRoZSB0aHJlYWQKPj4+
IHNsZWVwaW5nLCB0aGF0IHdpbGwgcXVldWUgdGhlIG5ldyBwYWNrZXQuCj4+Pgo+Pj4gU28sIGlu
IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCB0aGUgVFggd29ya2VyIGRvZXNuJ3QgY2hlY2sg
dGhlCj4+PiBjcmVkaXQgYXZhaWxhYmxlLCBpdCBvbmx5IHNlbmRzIHRoZSBwYWNrZXRzLgo+Pj4K
Pj4+PiBEb2VzIGl0IGhlbHAgdGhvdWdoPyBJdCBjZXJ0YWlubHkgYWRkcyB1cCB3b3JrIG91dHNp
ZGUgb2YKPj4+PiB1c2VyIHRocmVhZCBjb250ZXh0IHdoaWNoIG1lYW5zIGl0J3Mgbm90IGFjY291
bnRlZCBmb3IKPj4+PiBjb3JyZWN0bHkuCj4+PiBJIGNhbiB0cnkgdG8geG1pdCB0aGUgcGFja2V0
IGRpcmVjdGx5IGluIHRoZSB1c2VyIHRocmVhZCBjb250ZXh0LCB0byBzZWUKPj4+IHRoZSBpbXBy
b3ZlbWVudHMuCj4+Cj4+IEl0IHdpbGwgdGhlbiBsb29rcyBtb3JlIGxpa2Ugd2hhdCB2aXJ0aW8t
bmV0IChhbmQgb3RoZXIgbmV0d29ya2luZyBkZXZpY2UpCj4+IGRpZC4KPiBJJ2xsIHRyeSBBU0FQ
LCB0aGUgY2hhbmdlcyBzaG91bGQgbm90IGJlIHRvbyBjb21wbGljYXRlZC4uLiBJIGhvcGUgOikK
Pgo+Pgo+Pj4+IE1heWJlIHdlIHdhbnQgbW9yZSBWUXMuIFdvdWxkIGhlbHAgaW1wcm92ZSBwYXJh
bGxlbGlzbS4gVGhlIHF1ZXN0aW9uCj4+Pj4gd291bGQgdGhlbiBiZWNvbWUgaG93IHRvIG1hcCBz
b2NrZXRzIHRvIFZRcy4gV2l0aCBhIHNpbXBsZSBoYXNoCj4+Pj4gaXQncyBlYXN5IHRvIGNyZWF0
ZSBjb2xsaXNpb25zIC4uLgo+Pj4gWWVzLCBtb3JlIFZRcyBjYW4gaGVscCBidXQgdGhlIG1hcCBx
dWVzdGlvbiBpcyBub3Qgc2ltcGxlIHRvIGFuc3dlci4KPj4+IE1heWJlIHdlIGNhbiBkbyBhbiBo
YXNoIG9uIHRoZSAoY2lkLCBwb3J0KSBvciBkbyBzb21lIGtpbmQgb2YgZXN0aW1hdGlvbgo+Pj4g
b2YgcXVldWUgdXRpbGl6YXRpb24gYW5kIHRyeSB0byBiYWxhbmNlLgo+Pj4gU2hvdWxkIHRoZSBt
YXBwaW5nIGJlIHVuaXF1ZT8KPj4KPj4gSXQgc291bmRzIHRvIG1lIHlvdSB3YW50IHNvbWUga2lu
ZCBvZiBmYWlyIHF1ZXVpbmc/IFdlJ3ZlIGFscmVhZHkgaGFkCj4+IHNldmVyYWwgcWRpc2NzIHRo
YXQgZG8gdGhpcy4KPiBUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dCEKPgo+PiBTbyBpZiB3ZSB1
c2UgdGhlIGtlcm5lbCBuZXR3b3JraW5nIHhtaXQgcGF0aCwgYWxsIHRob3NlIGlzc3VlcyBjb3Vs
ZCBiZQo+PiBhZGRyZXNzZWQuCj4gT25lIG1vcmUgcG9pbnQgdG8gQUZfVlNPQ0sgKyBuZXQtc3Rh
Y2ssIGJ1dCB3ZSBoYXZlIHRvIGV2YWx1YXRlIHBvc3NpYmxlCj4gZHJhd2JhY2tzIGluIHVzaW5n
IHRoZSBuZXQtc3RhY2suIChlLmcuIG1vcmUgbGF0ZW5jeSBkdWUgdG8gdGhlIGNvbXBsZXhpdHkK
PiBvZiB0aGUgbmV0LXN0YWNrPykKCgpZZXMsIHdlIG5lZWQgYmVuY2htYXJrIHRoZSBwZXJmb3Jt
YW5jZS4gQnV0IGFzIHdlJ3ZlIG5vdGljZWQsIGN1cnJlbnQgCnZzb2NrIGltcGxlbWVudGF0aW9u
IGlzIG5vdCBlZmZpY2llbnQsIGFuZCBmb3Igc3RyZWFtIHNvY2tldCwgdGhlIApvdmVyaGVhZCBz
aG91bGQgYmUgbWluaW1hbC4gVGhlIG1vc3QgaW1wb3J0YW50IHRoaW5nIGlzIHRvIGF2b2lkIApy
ZWludmVudGluZyB0aGluZ3MgdGhhdCBoYXMgYWxyZWFkeSBleGlzdGVkLgoKVGhhbmtzCgoKPgo+
IFRoYW5rcywKPiBTdGVmYW5vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
