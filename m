Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F91B2ED
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 11:34:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 57670D4B;
	Mon, 13 May 2019 09:33:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC5C3AF7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 09:33:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E319A42D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 09:33:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 727AD3082B44;
	Mon, 13 May 2019 09:33:49 +0000 (UTC)
Received: from [10.72.12.49] (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 258576B8D7;
	Mon, 13 May 2019 09:33:41 +0000 (UTC)
Subject: Re: [PATCH v2 0/8] vsock/virtio: optimizations to increase the
	throughput
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
References: <20190510125843.95587-1-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <08c7e0aa-d90d-e0ff-a68c-0e182d077ab2@redhat.com>
Date: Mon, 13 May 2019 17:33:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510125843.95587-1-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 13 May 2019 09:33:49 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

Ck9uIDIwMTkvNS8xMCDkuIvljYg4OjU4LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gV2hp
bGUgSSB3YXMgdGVzdGluZyB0aGlzIG5ldyBzZXJpZXMgKHYyKSBJIGRpc2NvdmVyZWQgYW4gaHVn
ZSB1c2Ugb2YgbWVtb3J5Cj4gYW5kIGEgbWVtb3J5IGxlYWsgaW4gdGhlIHZpcnRpby12c29jayBk
cml2ZXIgaW4gdGhlIGd1ZXN0IHdoZW4gSSBzZW50Cj4gMS1ieXRlIHBhY2tldHMgdG8gdGhlIGd1
ZXN0Lgo+Cj4gVGhlc2UgaXNzdWVzIGFyZSBwcmVzZW50IHNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24g
b2YgdGhlIHZpcnRpby12c29jawo+IGRyaXZlci4gSSBhZGRlZCB0aGUgcGF0Y2hlcyAxIGFuZCAy
IHRvIGZpeCB0aGVtIGluIHRoaXMgc2VyaWVzIGluIG9yZGVyCj4gdG8gYmV0dGVyIHRyYWNrIHRo
ZSBwZXJmb3JtYW5jZSB0cmVuZHMuCj4KPiB2MTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9jb3Zlci8xMDg4NTQzMS8KPgo+IHYyOgo+IC0gQWRkIHBhdGNoIDEgdG8gbGltaXQgdGhlIG1l
bW9yeSB1c2FnZQo+IC0gQWRkIHBhdGNoIDIgdG8gYXZvaWQgbWVtb3J5IGxlYWsgZHVyaW5nIHRo
ZSBzb2NrZXQgcmVsZWFzZQo+IC0gQWRkIHBhdGNoIDMgdG8gZml4IGxvY2tpbmcgb2YgZndkX2Nu
dCBhbmQgYnVmX2FsbG9jCj4gLSBQYXRjaCA0OiBmaXggJ2ZyZWVfc3BhY2UnIHR5cGUgKHUzMiBp
bnN0ZWFkIG9mIHM2NCkgW1N0ZWZhbl0KPiAtIFBhdGNoIDU6IEF2b2lkIGludGVnZXIgdW5kZXJm
bG93IG9mIGlvdl9sZW4gW1N0ZWZhbl0KPiAtIFBhdGNoIDU6IEZpeCBwYWNrZXQgY2FwdHVyZSBp
biBvcmRlciB0byBzZWUgdGhlIGV4YWN0IHBhY2tldHMgdGhhdCBhcmUKPiAgICAgICAgICAgICBk
ZWxpdmVyZWQuIFtTdGVmYW5dCj4gLSBBZGQgcGF0Y2ggOCB0byBtYWtlIHRoZSBSWCBidWZmZXIg
c2l6ZSB0dW5hYmxlIFtTdGVmYW5dCj4KPiBCZWxvdyBhcmUgdGhlIGJlbmNobWFya3Mgc3RlcCBi
eSBzdGVwLiBJIHVzZWQgaXBlcmYzIFsxXSBtb2RpZmllZCB3aXRoIFZTT0NLCj4gc3VwcG9ydC4K
PiBBcyBNaWNoZWFsIHN1Z2dlc3RlZCBpbiB0aGUgdjEsIEkgYm9vdGVkIGhvc3QgYW5kIGd1ZXN0
IHdpdGggJ25vc21hcCcsIGFuZCBJCj4gYWRkZWQgYSBjb2x1bW4gd2l0aCB2aXJ0aW8tbmV0K3Zo
b3N0LW5ldCBwZXJmb3JtYW5jZS4KPgo+IEEgYnJpZWYgZGVzY3JpcHRpb24gb2YgcGF0Y2hlczoK
PiAtIFBhdGNoZXMgMSsyOiBsaW1pdCB0aGUgbWVtb3J5IHVzYWdlIHdpdGggYW4gZXh0cmEgY29w
eSBhbmQgYXZvaWQgbWVtb3J5IGxlYWsKPiAtIFBhdGNoZXMgMys0OiBmaXggbG9ja2luZyBhbmQg
cmVkdWNlIHRoZSBudW1iZXIgb2YgY3JlZGl0IHVwZGF0ZSBtZXNzYWdlcyBzZW50Cj4gICAgICAg
ICAgICAgICAgIHRvIHRoZSB0cmFuc21pdHRlcgo+IC0gUGF0Y2hlcyA1KzY6IGFsbG93IHRoZSBo
b3N0IHRvIHNwbGl0IHBhY2tldHMgb24gbXVsdGlwbGUgYnVmZmVycyBhbmQgdXNlCj4gICAgICAg
ICAgICAgICAgIFZJUlRJT19WU09DS19NQVhfUEtUX0JVRl9TSVpFIGFzIHRoZSBtYXggcGFja2V0
IHNpemUgYWxsb3dlZAo+IC0gUGF0Y2hlcyA3Kzg6IGluY3JlYXNlIFJYIGJ1ZmZlciBzaXplIHRv
IDY0IEtpQgo+Cj4gICAgICAgICAgICAgICAgICAgICAgaG9zdCAtPiBndWVzdCBbR2Jwc10KPiBw
a3Rfc2l6ZSBiZWZvcmUgb3B0ICBwIDErMiAgICBwIDMrNCAgICBwIDUrNiAgICBwIDcrOCAgICAg
ICB2aXJ0aW8tbmV0ICsgdmhvc3QKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENQX05PREVMQVkKPiA2NCAgICAg
ICAgIDAuMDY4ICAgICAwLjA2MyAgICAwLjEzMCAgICAwLjEzMSAgICAwLjEyOCAgICAgICAgIDAu
MTg4ICAgICAwLjE4Nwo+IDI1NiAgICAgICAgMC4yNzQgICAgIDAuMjM2ICAgIDAuMzkyICAgIDAu
MzM4ICAgIDAuMjgyICAgICAgICAgMC43NDkgICAgIDAuNjU0Cj4gNTEyICAgICAgICAwLjUzMSAg
ICAgMC40NTcgICAgMC44NjIgICAgMC43MjUgICAgMC42MDIgICAgICAgICAxLjQxOSAgICAgMS40
MTQKPiAxSyAgICAgICAgIDAuOTU0ICAgICAwLjgyNyAgICAxLjU5MSAgICAxLjU5OCAgICAxLjU0
OCAgICAgICAgIDIuNTk5ICAgICAyLjY0MAo+IDJLICAgICAgICAgMS43ODMgICAgIDEuNTQzICAg
IDMuNzMxICAgIDMuNjM3ICAgIDMuNDY5ICAgICAgICAgNC41MzAgICAgIDQuNzU0Cj4gNEsgICAg
ICAgICAzLjMzMiAgICAgMy40MzYgICAgNy4xNjQgICAgNy4xMjQgICAgNi40OTQgICAgICAgICA3
LjczOCAgICAgNy42OTYKPiA4SyAgICAgICAgIDUuNzkyICAgICA1LjUzMCAgIDExLjY1MyAgIDEx
Ljc4NyAgIDExLjQ0NCAgICAgICAgMTIuMzA3ICAgIDExLjg1MAo+IDE2SyAgICAgICAgOC40MDUg
ICAgIDguNDYyICAgMTYuMzcyICAgMTYuODU1ICAgMTcuNTYyICAgICAgICAxNi45MzYgICAgMTYu
OTU0Cj4gMzJLICAgICAgIDE0LjIwOCAgICAxMy42NjkgICAxOC45NDUgICAyMC4wMDkgICAyMy4x
MjggICAgICAgIDIxLjk4MCAgICAyMy4wMTUKPiA2NEsgICAgICAgMjEuMDgyICAgIDE4Ljg5MyAg
IDIwLjI2NiAgIDIwLjkwMyAgIDMwLjYyMiAgICAgICAgMjcuMjkwICAgIDI3LjM4Mwo+IDEyOEsg
ICAgICAyMC42OTYgICAgMjAuMTQ4ICAgMjAuMTEyICAgMjEuNzQ2ICAgMzIuMTUyICAgICAgICAz
MC40NDYgICAgMzAuOTkwCj4gMjU2SyAgICAgIDIwLjgwMSAgICAyMC41ODkgICAyMC43MjUgICAy
Mi42ODUgICAzNC43MjEgICAgICAgIDMzLjE1MSAgICAzMi43NDUKPiA1MTJLICAgICAgMjEuMjIw
ICAgIDIwLjQ2NSAgIDIwLjQzMiAgIDIyLjEwNiAgIDM0LjQ5NiAgICAgICAgMzYuODQ3ICAgIDMx
LjA5Ngo+Cj4gICAgICAgICAgICAgICAgICAgICAgZ3Vlc3QgLT4gaG9zdCBbR2Jwc10KPiBwa3Rf
c2l6ZSBiZWZvcmUgb3B0ICBwIDErMiAgICBwIDMrNCAgICBwIDUrNiAgICBwIDcrOCAgICAgICB2
aXJ0aW8tbmV0ICsgdmhvc3QKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENQX05PREVMQVkKPiA2NCAgICAgICAg
IDAuMDg5ICAgICAwLjA5MSAgICAwLjEyMCAgICAwLjExNSAgICAwLjExNyAgICAgICAgIDAuMjc0
ICAgICAwLjI3Mgo+IDI1NiAgICAgICAgMC4zNTIgICAgIDAuMzU0ICAgIDAuNDUyICAgIDAuNDQ1
ICAgIDAuNDUxICAgICAgICAgMS4wODUgICAgIDEuMTM2Cj4gNTEyICAgICAgICAwLjcwNSAgICAg
MC43MDQgICAgMC44OTMgICAgMC44NTggICAgMC44OTggICAgICAgICAyLjEzMSAgICAgMS44ODIK
PiAxSyAgICAgICAgIDEuMzk0ICAgICAxLjQzMyAgICAxLjcyMSAgICAxLjY2OSAgICAxLjY5MSAg
ICAgICAgIDMuOTg0ICAgICAzLjU3Ngo+IDJLICAgICAgICAgMi44MTggICAgIDIuODc0ICAgIDMu
MzE2ICAgIDMuMjQ5ICAgIDMuMzAzICAgICAgICAgNi43MTkgICAgIDYuMzU5Cj4gNEsgICAgICAg
ICA1LjI5MyAgICAgNS4zOTcgICAgNi4xMjkgICAgNS45MzMgICAgNi4wODIgICAgICAgIDEwLjEw
NSAgICAgOS44NjAKPiA4SyAgICAgICAgIDguODkwICAgICA5LjE1MSAgIDEwLjk5MCAgIDEwLjU0
NSAgIDEwLjUxOSAgICAgICAgMTUuMjM5ICAgIDE0Ljg2OAo+IDE2SyAgICAgICAxMS40NDQgICAg
MTEuMDE4ICAgMTIuMDc0ICAgMTUuMjU1ICAgMTUuNTc3ICAgICAgICAyMC41NTEgICAgMjAuODQ4
Cj4gMzJLICAgICAgIDExLjIyOSAgICAxMC44NzUgICAxMC44NTcgICAyNC40MDEgICAyNS4yMjcg
ICAgICAgIDI2LjI5NCAgICAyNi4zODAKPiA2NEsgICAgICAgMTAuODMyICAgIDEwLjU0NSAgIDEw
LjgxNiAgIDM5LjQ4NyAgIDM5LjYxNiAgICAgICAgMzQuOTk2ICAgIDMyLjA0MQo+IDEyOEsgICAg
ICAxMC40MzUgICAgMTAuMjQxICAgMTAuNTAwICAgMzkuODEzICAgNDAuMDEyICAgICAgICAzOC4z
NzkgICAgMzUuMDU1Cj4gMjU2SyAgICAgIDEwLjI2MyAgICAgOS44NjYgICAgOS44NDUgICAzNC45
NzEgICAzNS4xNDMgICAgICAgIDM2LjU1OSAgICAzNy4yMzIKPiA1MTJLICAgICAgMTAuMjI0ICAg
IDEwLjA2MCAgIDEwLjA5MiAgIDM1LjQ2OSAgIDM0LjYyNyAgICAgICAgMzQuOTYzICAgIDMzLjQw
MQo+Cj4gQXMgU3RlZmFuIHN1Z2dlc3RlZCBpbiB0aGUgdjEsIHRoaXMgdGltZSBJIG1lYXN1cmVk
IGFsc28gdGhlIGVmZmljaWVuY3kgaW4gdGhpcwo+IHdheToKPiAgICAgIGVmZmljaWVuY3kgPSBN
YnBzIC8gKCVDUFVfSG9zdCArICVDUFVfR3Vlc3QpCj4KPiBUaGUgJyVDUFVfR3Vlc3QnIGlzIHRh
a2VuIGluc2lkZSB0aGUgVk0uIEkga25vdyB0aGF0IGl0IGlzIG5vdCB0aGUgYmVzdCB3YXksCj4g
YnV0IGl0J3MgcHJvdmlkZWQgZm9yIGZyZWUgZnJvbSBpcGVyZjMgYW5kIGNvdWxkIGJlIGFuIGlu
ZGljYXRpb24uCj4KPiAgICAgICAgICBob3N0IC0+IGd1ZXN0IGVmZmljaWVuY3kgW01icHMgLyAo
JUNQVV9Ib3N0ICsgJUNQVV9HdWVzdCldCj4gcGt0X3NpemUgYmVmb3JlIG9wdCAgcCAxKzIgICAg
cCAzKzQgICAgcCA1KzYgICAgcCA3KzggICAgICAgdmlydGlvLW5ldCArIHZob3N0Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFRDUF9OT0RFTEFZCj4gNjQgICAgICAgICAgMC45NCAgICAgIDAuNTkgICAgIDMuOTYg
ICAgIDQuMDYgICAgIDQuMDkgICAgICAgICAgMi44MiAgICAgIDIuMTEKPiAyNTYgICAgICAgICAy
LjYyICAgICAgMi41MCAgICAgNi40NSAgICAgNi4wOSAgICAgNS44MSAgICAgICAgICA5LjY0ICAg
ICAgOC43Mwo+IDUxMiAgICAgICAgIDUuMTYgICAgICA0Ljg3ICAgIDEzLjE2ICAgIDEyLjM5ICAg
IDExLjY3ICAgICAgICAgMTcuODMgICAgIDE3Ljc2Cj4gMUsgICAgICAgICAgOS4xNiAgICAgIDgu
ODUgICAgMjQuOTggICAgMjQuOTcgICAgMjUuMDEgICAgICAgICAzMi41NyAgICAgMzIuMDQKPiAy
SyAgICAgICAgIDE3LjQxICAgICAxNy4wMyAgICA0OS4wOSAgICA0OC41OSAgICA0OS4yMiAgICAg
ICAgIDU1LjMxICAgICA1Ny4xNAo+IDRLICAgICAgICAgMzIuOTkgICAgIDMzLjYyICAgIDkwLjgw
ICAgIDkwLjk4ICAgIDkxLjcyICAgICAgICAgOTEuNzkgICAgIDkxLjQwCj4gOEsgICAgICAgICA1
OC41MSAgICAgNTkuOTggICAxNTMuNTMgICAxNzAuODMgICAxNjcuMzEgICAgICAgIDEzNy41MSAg
ICAxMzIuODUKPiAxNksgICAgICAgIDg5LjMyICAgICA5NS4yOSAgIDIxNi45OCAgIDI2NC4xOCAg
IDI2MC45NSAgICAgICAgMTc2LjA1ICAgIDE3Ni4wNQo+IDMySyAgICAgICAxNTIuOTQgICAgMTY3
LjEwICAgMjg1Ljc1ICAgMzg3LjAyICAgMzYwLjgxICAgICAgICAyMTUuNDkgICAgMjI2LjMwCj4g
NjRLICAgICAgIDI1MC4zOCAgICAzMDcuMjAgICAzMTcuNjUgICA0ODkuNTMgICA0NzIuNzAgICAg
ICAgIDIzOC45NyAgICAyNDQuMjcKPiAxMjhLICAgICAgMzI3Ljk5ICAgIDMzNS4yNCAgIDMzNS43
NiAgIDUyMy43MSAgIDQ4Ni40MSAgICAgICAgMjUzLjI5ICAgIDI2MC44Ngo+IDI1NksgICAgICAz
MjcuMDYgICAgMzM0LjI0ICAgMzM4LjY0ICAgNTMzLjc2ICAgNTA5Ljg1ICAgICAgICAyNjcuNzgg
ICAgMjY2LjIyCj4gNTEySyAgICAgIDMzNy4zNiAgICAzMzAuNjEgICAzMzQuOTUgICA1MTIuOTAg
ICA0OTYuMzUgICAgICAgIDI4MC40MiAgICAyNDEuNDMKPgo+ICAgICAgICAgIGd1ZXN0IC0+IGhv
c3QgZWZmaWNpZW5jeSBbTWJwcyAvICglQ1BVX0hvc3QgKyAlQ1BVX0d1ZXN0KV0KPiBwa3Rfc2l6
ZSBiZWZvcmUgb3B0ICBwIDErMiAgICBwIDMrNCAgICBwIDUrNiAgICBwIDcrOCAgICAgICB2aXJ0
aW8tbmV0ICsgdmhvc3QKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENQX05PREVMQVkKPiA2NCAgICAgICAgICAw
LjkwICAgICAgMC45MSAgICAgMS4zNyAgICAgMS4zMiAgICAgMS4zNSAgICAgICAgICAyLjE1ICAg
ICAgMi4xMwo+IDI1NiAgICAgICAgIDMuNTkgICAgICAzLjU1ICAgICA1LjIzICAgICA1LjE5ICAg
ICA1LjI5ICAgICAgICAgIDguNTAgICAgICA4Ljg5Cj4gNTEyICAgICAgICAgNy4xOSAgICAgIDcu
MDggICAgMTAuMjEgICAgIDkuOTUgICAgMTAuMzggICAgICAgICAxNi43NCAgICAgMTQuNzEKPiAx
SyAgICAgICAgIDE0LjE1ICAgICAxNC4zNCAgICAxOS44NSAgICAxOS4wNiAgICAxOS4zMyAgICAg
ICAgIDMxLjQ0ICAgICAyOC4xMQo+IDJLICAgICAgICAgMjguNDQgICAgIDI5LjA5ICAgIDM3Ljc4
ICAgIDM3LjE4ICAgIDM3LjQ5ICAgICAgICAgNTMuMDcgICAgIDUwLjYzCj4gNEsgICAgICAgICA1
NS4zNyAgICAgNTcuNjAgICAgNzEuMDIgICAgNjkuMjcgICAgNzAuOTcgICAgICAgICA4MS41NiAg
ICAgNzkuMzIKPiA4SyAgICAgICAgMTA1LjU4ICAgIDEwMC40NSAgIDExMS45NSAgIDEyNC42OCAg
IDEyMy42MSAgICAgICAgMTIwLjg1ICAgIDExOC42Ngo+IDE2SyAgICAgICAxNDEuNjMgICAgMTM4
LjI0ICAgMTM3LjY3ICAgMTg3LjQxICAgMTkwLjIwICAgICAgICAxNjAuNDMgICAgMTYzLjAwCj4g
MzJLICAgICAgIDE0Ny41NiAgICAxNDMuMDkgICAxMzguNDggICAyOTYuNDEgICAzMDEuMDQgICAg
ICAgIDIxNC42NCAgICAyMjMuOTQKPiA2NEsgICAgICAgMTQ0LjgxICAgIDE0My4yNyAgIDEzOC40
OSAgIDQzMy45OCAgIDQ2Mi4yNiAgICAgICAgMjk4Ljg2ICAgIDI2OS43MQo+IDEyOEsgICAgICAx
NTAuMTQgICAgMTQ3Ljk5ICAgMTQ2Ljg1ICAgNTExLjM2ICAgNTE0LjI5ICAgICAgICAzNTAuMTcg
ICAgMjk4LjA5Cj4gMjU2SyAgICAgIDE1Ni42OSAgICAxNTIuMjUgICAxNDguNjkgICA1NDIuMTkg
ICA1NDkuOTcgICAgICAgIDMyNi40MiAgICAzMzMuMzIKPiA1MTJLICAgICAgMTU3LjI5ICAgIDE1
My4zNSAgIDE1Mi4yMiAgIDU0Ni41MiAgIDUzMy4yNCAgICAgICAgMzE1LjU1ICAgIDMwMi4yNwo+
Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGVmYW5vLWdhcnphcmVsbGEvaXBlcmYvCgoKSGk6
CgpEbyB5b3UgaGF2ZSBhbnkgZXhwbGFuYXRpb24gdGhhdCB2c29jayBpcyBiZXR0ZXIgaGVyZT8g
SXMgdGhpcyBiZWNhdXNlIApvZiB0aGUgbWVyZ2VhYmxlIGJ1ZmZlcj8gSWYgeW91LCB3ZSBuZWVk
IHRlc3Qgd2l0aCBtcmdfcnhidWY9b2ZmLgoKVGhhbmtzCgoKPgo+IFN0ZWZhbm8gR2FyemFyZWxs
YSAoOCk6Cj4gICAgdnNvY2svdmlydGlvOiBsaW1pdCB0aGUgbWVtb3J5IHVzZWQgcGVyLXNvY2tl
dAo+ICAgIHZzb2NrL3ZpcnRpbzogZnJlZSBwYWNrZXRzIGR1cmluZyB0aGUgc29ja2V0IHJlbGVh
c2UKPiAgICB2c29jay92aXJ0aW86IGZpeCBsb2NraW5nIGZvciBmd2RfY250IGFuZCBidWZfYWxs
b2MKPiAgICB2c29jay92aXJ0aW86IHJlZHVjZSBjcmVkaXQgdXBkYXRlIG1lc3NhZ2VzCj4gICAg
dmhvc3QvdnNvY2s6IHNwbGl0IHBhY2tldHMgdG8gc2VuZCB1c2luZyBtdWx0aXBsZSBidWZmZXJz
Cj4gICAgdnNvY2svdmlydGlvOiBjaGFuZ2UgdGhlIG1heGltdW0gcGFja2V0IHNpemUgYWxsb3dl
ZAo+ICAgIHZzb2NrL3ZpcnRpbzogaW5jcmVhc2UgUlggYnVmZmVyIHNpemUgdG8gNjQgS2lCCj4g
ICAgdnNvY2svdmlydGlvOiBtYWtlIHRoZSBSWCBidWZmZXIgc2l6ZSB0dW5hYmxlCj4KPiAgIGRy
aXZlcnMvdmhvc3QvdnNvY2suYyAgICAgICAgICAgICAgICAgICB8ICA1MyArKysrKysrLS0KPiAg
IGluY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmggICAgICAgICAgICB8ICAxNCArKy0KPiAgIG5l
dC92bXdfdnNvY2svdmlydGlvX3RyYW5zcG9ydC5jICAgICAgICB8ICAyOCArKysrLQo+ICAgbmV0
L3Ztd192c29jay92aXJ0aW9fdHJhbnNwb3J0X2NvbW1vbi5jIHwgMTQ0ICsrKysrKysrKysrKysr
KysrKy0tLS0tLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxOTAgaW5zZXJ0aW9ucygrKSwgNDkgZGVs
ZXRpb25zKC0pCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
