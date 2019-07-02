Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E75C8C1
	for <lists.virtualization@lfdr.de>; Tue,  2 Jul 2019 07:25:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F1231320;
	Tue,  2 Jul 2019 05:25:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 57663F33
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 05:24:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 38B7D70D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 05:24:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98DB433025F;
	Tue,  2 Jul 2019 05:24:51 +0000 (UTC)
Received: from [10.72.12.205] (ovpn-12-205.pek2.redhat.com [10.72.12.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 847F41001B01;
	Tue,  2 Jul 2019 05:24:45 +0000 (UTC)
Subject: Re: Reminder: 2 open syzbot bugs in vhost subsystem
To: Eric Biggers <ebiggers@kernel.org>, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Hillf Danton <hdanton@sina.com>
References: <20190702051707.GF23743@sol.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e2da1124-52c3-84ff-77ce-deb017711138@redhat.com>
Date: Tue, 2 Jul 2019 13:24:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702051707.GF23743@sol.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 02 Jul 2019 05:24:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
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

Ck9uIDIwMTkvNy8yIOS4i+WNiDE6MTcsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiBbVGhpcyBlbWFp
bCB3YXMgZ2VuZXJhdGVkIGJ5IGEgc2NyaXB0LiAgTGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55
IHN1Z2dlc3Rpb25zCj4gdG8gbWFrZSBpdCBiZXR0ZXIsIG9yIGlmIHlvdSB3YW50IGl0IHJlLWdl
bmVyYXRlZCB3aXRoIHRoZSBsYXRlc3Qgc3RhdHVzLl0KPgo+IE9mIHRoZSBjdXJyZW50bHkgb3Bl
biBzeXpib3QgcmVwb3J0cyBhZ2FpbnN0IHRoZSB1cHN0cmVhbSBrZXJuZWwsIEkndmUgbWFudWFs
bHkKPiBtYXJrZWQgMiBvZiB0aGVtIGFzIHBvc3NpYmx5IGJlaW5nIGJ1Z3MgaW4gdGhlIHZob3N0
IHN1YnN5c3RlbS4gIEkndmUgbGlzdGVkCj4gdGhlc2UgcmVwb3J0cyBiZWxvdywgc29ydGVkIGJ5
IGFuIGFsZ29yaXRobSB0aGF0IHRyaWVzIHRvIGxpc3QgZmlyc3QgdGhlIHJlcG9ydHMKPiBtb3N0
IGxpa2VseSB0byBiZSBzdGlsbCB2YWxpZCwgaW1wb3J0YW50LCBhbmQgYWN0aW9uYWJsZS4KPgo+
IE9mIHRoZXNlIDIgYnVncywgMSB3YXMgc2VlbiBpbiBtYWlubGluZSBpbiB0aGUgbGFzdCB3ZWVr
Lgo+Cj4gSWYgeW91IGJlbGlldmUgYSBidWcgaXMgbm8gbG9uZ2VyIHZhbGlkLCBwbGVhc2UgY2xv
c2UgdGhlIHN5emJvdCByZXBvcnQgYnkKPiBzZW5kaW5nIGEgJyNzeXogZml4JywgJyNzeXogZHVw
Jywgb3IgJyNzeXogaW52YWxpZCcgY29tbWFuZCBpbiByZXBseSB0byB0aGUKPiBvcmlnaW5hbCB0
aHJlYWQsIGFzIGV4cGxhaW5lZCBhdCBodHRwczovL2dvby5nbC90cHNtRUojc3RhdHVzCj4KPiBJ
ZiB5b3UgYmVsaWV2ZSBJIG1pc2F0dHJpYnV0ZWQgYSBidWcgdG8gdGhlIHZob3N0IHN1YnN5c3Rl
bSwgcGxlYXNlIGxldCBtZSBrbm93LAo+IGFuZCBpZiBwb3NzaWJsZSBmb3J3YXJkIHRoZSByZXBv
cnQgdG8gdGhlIGNvcnJlY3QgcGVvcGxlIG9yIG1haWxpbmcgbGlzdC4KPgo+IEhlcmUgYXJlIHRo
ZSBidWdzOgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBUaXRsZTogICAgICAgICAgICAg
IG1lbW9yeSBsZWFrIGluIHZob3N0X25ldF9pb2N0bAo+IExhc3Qgb2NjdXJyZWQ6ICAgICAgMCBk
YXlzIGFnbwo+IFJlcG9ydGVkOiAgICAgICAgICAgMjYgZGF5cyBhZ28KPiBCcmFuY2hlczogICAg
ICAgICAgIE1haW5saW5lCj4gRGFzaGJvYXJkIGxpbms6ICAgICBodHRwczovL3N5emthbGxlci5h
cHBzcG90LmNvbS9idWc/aWQ9MTJiYTM0OWQ3ZTI2Y2NmZTk1MzE3YmMzNzZlODEyZWJiYWUyZWUw
Zgo+IE9yaWdpbmFsIHRocmVhZDogICAgaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvbGttbC8wMDAw
MDAwMDAwMDAxODhkYTEwNThhOWMyNWUzQGdvb2dsZS5jb20vVC8jdQo+Cj4gVGhpcyBidWcgaGFz
IGEgQyByZXByb2R1Y2VyLgo+Cj4gVGhlIG9yaWdpbmFsIHRocmVhZCBmb3IgdGhpcyBidWcgaGFz
IHJlY2VpdmVkIDQgcmVwbGllczsgdGhlIGxhc3Qgd2FzIDE3IGRheXMKPiBhZ28uCj4KPiBJZiB5
b3UgZml4IHRoaXMgYnVnLCBwbGVhc2UgYWRkIHRoZSBmb2xsb3dpbmcgdGFnIHRvIHRoZSBjb21t
aXQ6Cj4gICAgICBSZXBvcnRlZC1ieTogc3l6Ym90KzA3ODlmMGM3ZTQ1ZWZkN2JiNjQzQHN5emth
bGxlci5hcHBzcG90bWFpbC5jb20KPgo+IElmIHlvdSBzZW5kIGFueSBlbWFpbCBvciBwYXRjaCBm
b3IgdGhpcyBidWcsIHBsZWFzZSBjb25zaWRlciByZXBseWluZyB0byB0aGUKPiBvcmlnaW5hbCB0
aHJlYWQuICBGb3IgdGhlIGdpdCBzZW5kLWVtYWlsIGNvbW1hbmQgdG8gdXNlLCBvciB0aXBzIG9u
IGhvdyB0byByZXBseQo+IGlmIHRoZSB0aHJlYWQgaXNuJ3QgaW4geW91ciBtYWlsYm94LCBzZWUg
dGhlICJSZXBseSBpbnN0cnVjdGlvbnMiIGF0Cj4gaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8w
MDAwMDAwMDAwMDAxODhkYTEwNThhOWMyNWUzQGdvb2dsZS5jb20KCgpDYyBIaWxsZiB3aG8gc2hv
dWxkIGhhZCBhIGZpeCBmb3IgdGhpcy4KCkhpbGxmLCB3b3VsZCB5b3UgcGxlYXNlIHBvc3QgYSBm
b3JtYWwgcGF0Y2ggZm9yIHRoaXM/IChmb3IgLW5ldCkKCgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiBUaXRsZTogICAgICAgICAgICAgIElORk86IHRhc2sgaHVuZyBpbiB2aG9zdF9pbml0
X2RldmljZV9pb3RsYgo+IExhc3Qgb2NjdXJyZWQ6ICAgICAgMTI1IGRheXMgYWdvCj4gUmVwb3J0
ZWQ6ICAgICAgICAgICAxNTMgZGF5cyBhZ28KPiBCcmFuY2hlczogICAgICAgICAgIE1haW5saW5l
IGFuZCBvdGhlcnMKPiBEYXNoYm9hcmQgbGluazogICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNw
b3QuY29tL2J1Zz9pZD1jYjFlYThkYWYwM2E1OTQyYzJhYjMxNDY3OTE0OGNmNmUxMjhlZjU4Cj4g
T3JpZ2luYWwgdGhyZWFkOiAgICBodHRwczovL2xrbWwua2VybmVsLm9yZy9sa21sLzAwMDAwMDAw
MDAwMDdlODZmZDA1ODA5NTUzM2ZAZ29vZ2xlLmNvbS9ULyN1Cj4KPiBVbmZvcnR1bmF0ZWx5LCB0
aGlzIGJ1ZyBkb2VzIG5vdCBoYXZlIGEgcmVwcm9kdWNlci4KPgo+IFRoZSBvcmlnaW5hbCB0aHJl
YWQgZm9yIHRoaXMgYnVnIHJlY2VpdmVkIDIgcmVwbGllczsgdGhlIGxhc3Qgd2FzIDE1MiBkYXlz
IGFnby4KPgo+IElmIHlvdSBmaXggdGhpcyBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0
YWcgdG8gdGhlIGNvbW1pdDoKPiAgICAgIFJlcG9ydGVkLWJ5OiBzeXpib3QrNDBlMjhhOGJkNTlk
MTBlZDBjNDJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+Cj4gSWYgeW91IHNlbmQgYW55IGVt
YWlsIG9yIHBhdGNoIGZvciB0aGlzIGJ1ZywgcGxlYXNlIGNvbnNpZGVyIHJlcGx5aW5nIHRvIHRo
ZQo+IG9yaWdpbmFsIHRocmVhZC4gIEZvciB0aGUgZ2l0IHNlbmQtZW1haWwgY29tbWFuZCB0byB1
c2UsIG9yIHRpcHMgb24gaG93IHRvIHJlcGx5Cj4gaWYgdGhlIHRocmVhZCBpc24ndCBpbiB5b3Vy
IG1haWxib3gsIHNlZSB0aGUgIlJlcGx5IGluc3RydWN0aW9ucyIgYXQKPiBodHRwczovL2xrbWwu
a2VybmVsLm9yZy9yLzAwMDAwMDAwMDAwMDdlODZmZDA1ODA5NTUzM2ZAZ29vZ2xlLmNvbQo+CgpD
YW4gc3l6Ym90IHN0aWxsIHJlcHJvZHVjZSB0aGlzIGlzc3VlPwoKVGhhbmtzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
