Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C26B4347F
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 11:10:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 274731362;
	Thu, 13 Jun 2019 09:10:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B211130E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 09:10:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8FF88174
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 09:10:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E94588E63;
	Thu, 13 Jun 2019 09:10:14 +0000 (UTC)
Received: from [10.72.12.64] (ovpn-12-64.pek2.redhat.com [10.72.12.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AECB45F9B0;
	Thu, 13 Jun 2019 09:09:50 +0000 (UTC)
Subject: Re: memory leak in vhost_net_ioctl
To: Hillf Danton <hdanton@sina.com>,
	syzbot <syzbot+0789f0c7e45efd7bb643@syzkaller.appspotmail.com>
References: <20190606144013.9884-1-hdanton@sina.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4664ac5d-07b7-a141-4130-b563b7974181@redhat.com>
Date: Thu, 13 Jun 2019 17:09:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606144013.9884-1-hdanton@sina.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Jun 2019 09:10:24 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xdp-newbies@vger.kernel.org, jakub.kicinski@netronome.com, hawk@kernel.org,
	daniel@iogearbox.net, mst@redhat.com, netdev@vger.kernel.org,
	john.fastabend@gmail.com, ast@kernel.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	kvm@vger.kernel.org, bpf@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net
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

Ck9uIDIwMTkvNi82IOS4i+WNiDEwOjQwLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4KPiBPbiBXZWQs
IDA1IEp1biAyMDE5IDE2OjQyOjA1IC0wNzAwIChQRFQpIHN5emJvdCB3cm90ZToKPj4gSGVsbG8s
Cj4+Cj4+IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOgo+Pgo+PiBIRUFEIGNv
bW1pdDrCoMKgwqAgNzg4YTAyNDkgTWVyZ2UgdGFnICdhcmMtNS4yLXJjNCcgb2YgCj4+IGdpdDov
L2dpdC5rZXJuZWwub3JnL3AuLgo+PiBnaXQgdHJlZTrCoMKgwqDCoMKgwqAgdXBzdHJlYW0KPj4g
Y29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94
PTE1ZGM5ZWE2YTAwMDAwCj4+IGtlcm5lbCBjb25maWc6IAo+PiBodHRwczovL3N5emthbGxlci5h
cHBzcG90LmNvbS94Ly5jb25maWc/eD1kNWM3MzgyNWNiZGM3MzI2Cj4+IGRhc2hib2FyZCBsaW5r
OiAKPj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTA3ODlmMGM3ZTQ1
ZWZkN2JiNjQzCj4+IGNvbXBpbGVyOsKgwqDCoMKgwqDCoCBnY2MgKEdDQykgOS4wLjAgMjAxODEy
MzEgKGV4cGVyaW1lbnRhbCkKPj4gc3l6IHJlcHJvOiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94L3JlcHJvLnN5ej94PTEwYjMxNzYxYTAwMDAwCj4+IEMgcmVwcm9kdWNlcjogaHR0cHM6
Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTI0ODkyYzFhMDAwMDAKPj4KPj4g
SU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBidWcsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0
YWcgdG8gdGhlIAo+PiBjb21taXQ6Cj4+IFJlcG9ydGVkLWJ5OiBzeXpib3QrMDc4OWYwYzdlNDVl
ZmQ3YmI2NDNAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+Pgo+PiB1ZGl0OiB0eXBlPTE0MDAg
YXVkaXQoMTU1OTc2ODcwMy4yMjk6MzYpOiBhdmM6wqAgZGVuaWVkwqAgeyBtYXAgfSBmb3LCoCAK
Pj4gcGlkPTcxMTYgY29tbT0ic3l6LWV4ZWN1dG9yMzMwIiBwYXRoPSIvcm9vdC9zeXotZXhlY3V0
b3IzMzAzMzQ4OTciIAo+PiBkZXY9InNkYTEiIGlubz0xNjQ2MSAKPj4gc2NvbnRleHQ9dW5jb25m
aW5lZF91OnN5c3RlbV9yOmluc21vZF90OnMwLXMwOmMwLmMxMDIzIAo+PiB0Y29udGV4dD11bmNv
bmZpbmVkX3U6b2JqZWN0X3I6dXNlcl9ob21lX3Q6czAgdGNsYXNzPWZpbGUgcGVybWlzc2l2ZT0x
Cj4+IGV4ZWN1dGluZyBwcm9ncmFtCj4+IGV4ZWN1dGluZyBwcm9ncmFtCj4+IEJVRzogbWVtb3J5
IGxlYWsKPj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMjQyMWZlNDAgKHNpemUgNjQp
Ogo+PiDCoMKgIGNvbW0gInN5ei1leGVjdXRvcjMzMCIsIHBpZCA3MTE3LCBqaWZmaWVzIDQyOTQ5
NDkyNDUgKGFnZSAxMy4wMzBzKQo+PiDCoMKgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4+
IMKgwqDCoMKgIDAxIDAwIDAwIDAwIDIwIDY5IDZmIDYzIDAwIDAwIDAwIDAwIDY0IDY1IDc2IDJm
wqAgLi4uLiBpb2MuLi4uZGV2Lwo+PiDCoMKgwqDCoCA1MCBmZSAyMSAyNCA4MSA4OCBmZiBmZiA1
MCBmZSAyMSAyNCA4MSA4OCBmZiBmZiBQLiEkLi4uLlAuISQuLi4uCj4+IMKgwqAgYmFja3RyYWNl
Ogo+PiDCoMKgwqDCoCBbPDAwMDAwMDAwYWUwYzRhZTA+XSBrbWVtbGVha19hbGxvY19yZWN1cnNp
dmUgCj4+IGluY2x1ZGUvbGludXgva21lbWxlYWsuaDo1NSBbaW5saW5lXQo+PiDCoMKgwqDCoCBb
PDAwMDAwMDAwYWUwYzRhZTA+XSBzbGFiX3Bvc3RfYWxsb2NfaG9vayBtbS9zbGFiLmg6NDM5IFtp
bmxpbmVdCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDBhZTBjNGFlMD5dIHNsYWJfYWxsb2MgbW0vc2xh
Yi5jOjMzMjYgW2lubGluZV0KPj4gwqDCoMKgwqAgWzwwMDAwMDAwMGFlMGM0YWUwPl0ga21lbV9j
YWNoZV9hbGxvY190cmFjZSsweDEzZC8weDI4MCAKPj4gbW0vc2xhYi5jOjM1NTMKPj4gwqDCoMKg
wqAgWzwwMDAwMDAwMDc5ZWJhYjM4Pl0ga21hbGxvYyBpbmNsdWRlL2xpbnV4L3NsYWIuaDo1NDcg
W2lubGluZV0KPj4gwqDCoMKgwqAgWzwwMDAwMDAwMDc5ZWJhYjM4Pl0gdmhvc3RfbmV0X3VidWZf
YWxsb2MgCj4+IGRyaXZlcnMvdmhvc3QvbmV0LmM6MjQxIFtpbmxpbmVdCj4+IMKgwqDCoMKgIFs8
MDAwMDAwMDA3OWViYWIzOD5dIHZob3N0X25ldF9zZXRfYmFja2VuZCAKPj4gZHJpdmVycy92aG9z
dC9uZXQuYzoxNTM0IFtpbmxpbmVdCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDA3OWViYWIzOD5dIHZo
b3N0X25ldF9pb2N0bCsweGI0My8weGMxMCAKPj4gZHJpdmVycy92aG9zdC9uZXQuYzoxNzE2Cj4+
IMKgwqDCoMKgIFs8MDAwMDAwMDA5ZjYyMDRhMj5dIHZmc19pb2N0bCBmcy9pb2N0bC5jOjQ2IFtp
bmxpbmVdCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDA5ZjYyMDRhMj5dIGZpbGVfaW9jdGwgZnMvaW9j
dGwuYzo1MDkgW2lubGluZV0KPj4gwqDCoMKgwqAgWzwwMDAwMDAwMDlmNjIwNGEyPl0gZG9fdmZz
X2lvY3RsKzB4NjJhLzB4ODEwIGZzL2lvY3RsLmM6Njk2Cj4+IMKgwqDCoMKgIFs8MDAwMDAwMDBi
NDU4NjZkZT5dIGtzeXNfaW9jdGwrMHg4Ni8weGIwIGZzL2lvY3RsLmM6NzEzCj4+IMKgwqDCoMKg
IFs8MDAwMDAwMDBkZmI0MWViOD5dIF9fZG9fc3lzX2lvY3RsIGZzL2lvY3RsLmM6NzIwIFtpbmxp
bmVdCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDBkZmI0MWViOD5dIF9fc2Vfc3lzX2lvY3RsIGZzL2lv
Y3RsLmM6NzE4IFtpbmxpbmVdCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDBkZmI0MWViOD5dIF9feDY0
X3N5c19pb2N0bCsweDFlLzB4MzAgZnMvaW9jdGwuYzo3MTgKPj4gwqDCoMKgwqAgWzwwMDAwMDAw
MDQ5YzFmNTQ3Pl0gZG9fc3lzY2FsbF82NCsweDc2LzB4MWEwIAo+PiBhcmNoL3g4Ni9lbnRyeS9j
b21tb24uYzozMDEKPj4gwqDCoMKgwqAgWzwwMDAwMDAwMDI5Y2M4Y2E3Pl0gZW50cnlfU1lTQ0FM
TF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQo+Pgo+PiBCVUc6IG1lbW9yeSBsZWFrCj4+IHVu
cmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTI0MjFmYTgwIChzaXplIDY0KToKPj4gwqDCoCBj
b21tICJzeXotZXhlY3V0b3IzMzAiLCBwaWQgNzEzMCwgamlmZmllcyA0Mjk0OTQ5NzU1IChhZ2Ug
Ny45MzBzKQo+PiDCoMKgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4+IMKgwqDCoMKgIDAx
IDAwIDAwIDAwIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDJmIDc2IDY5IDcyIC4uLi4uLi4uLi4u
Li92aXIKPj4gwqDCoMKgwqAgOTAgZmEgMjEgMjQgODEgODggZmYgZmYgOTAgZmEgMjEgMjQgODEg
ODggZmYgZmYgLi4hJC4uLi4uLiEkLi4uLgo+PiDCoMKgIGJhY2t0cmFjZToKPj4gwqDCoMKgwqAg
WzwwMDAwMDAwMGFlMGM0YWUwPl0ga21lbWxlYWtfYWxsb2NfcmVjdXJzaXZlIAo+PiBpbmNsdWRl
L2xpbnV4L2ttZW1sZWFrLmg6NTUgW2lubGluZV0KPj4gwqDCoMKgwqAgWzwwMDAwMDAwMGFlMGM0
YWUwPl0gc2xhYl9wb3N0X2FsbG9jX2hvb2sgbW0vc2xhYi5oOjQzOSBbaW5saW5lXQo+PiDCoMKg
wqDCoCBbPDAwMDAwMDAwYWUwYzRhZTA+XSBzbGFiX2FsbG9jIG1tL3NsYWIuYzozMzI2IFtpbmxp
bmVdCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDBhZTBjNGFlMD5dIGttZW1fY2FjaGVfYWxsb2NfdHJh
Y2UrMHgxM2QvMHgyODAgCj4+IG1tL3NsYWIuYzozNTUzCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDA3
OWViYWIzOD5dIGttYWxsb2MgaW5jbHVkZS9saW51eC9zbGFiLmg6NTQ3IFtpbmxpbmVdCj4+IMKg
wqDCoMKgIFs8MDAwMDAwMDA3OWViYWIzOD5dIHZob3N0X25ldF91YnVmX2FsbG9jIAo+PiBkcml2
ZXJzL3Zob3N0L25ldC5jOjI0MSBbaW5saW5lXQo+PiDCoMKgwqDCoCBbPDAwMDAwMDAwNzllYmFi
Mzg+XSB2aG9zdF9uZXRfc2V0X2JhY2tlbmQgCj4+IGRyaXZlcnMvdmhvc3QvbmV0LmM6MTUzNCBb
aW5saW5lXQo+PiDCoMKgwqDCoCBbPDAwMDAwMDAwNzllYmFiMzg+XSB2aG9zdF9uZXRfaW9jdGwr
MHhiNDMvMHhjMTAgCj4+IGRyaXZlcnMvdmhvc3QvbmV0LmM6MTcxNgo+PiDCoMKgwqDCoCBbPDAw
MDAwMDAwOWY2MjA0YTI+XSB2ZnNfaW9jdGwgZnMvaW9jdGwuYzo0NiBbaW5saW5lXQo+PiDCoMKg
wqDCoCBbPDAwMDAwMDAwOWY2MjA0YTI+XSBmaWxlX2lvY3RsIGZzL2lvY3RsLmM6NTA5IFtpbmxp
bmVdCj4+IMKgwqDCoMKgIFs8MDAwMDAwMDA5ZjYyMDRhMj5dIGRvX3Zmc19pb2N0bCsweDYyYS8w
eDgxMCBmcy9pb2N0bC5jOjY5Ngo+PiDCoMKgwqDCoCBbPDAwMDAwMDAwYjQ1ODY2ZGU+XSBrc3lz
X2lvY3RsKzB4ODYvMHhiMCBmcy9pb2N0bC5jOjcxMwo+PiDCoMKgwqDCoCBbPDAwMDAwMDAwZGZi
NDFlYjg+XSBfX2RvX3N5c19pb2N0bCBmcy9pb2N0bC5jOjcyMCBbaW5saW5lXQo+PiDCoMKgwqDC
oCBbPDAwMDAwMDAwZGZiNDFlYjg+XSBfX3NlX3N5c19pb2N0bCBmcy9pb2N0bC5jOjcxOCBbaW5s
aW5lXQo+PiDCoMKgwqDCoCBbPDAwMDAwMDAwZGZiNDFlYjg+XSBfX3g2NF9zeXNfaW9jdGwrMHgx
ZS8weDMwIGZzL2lvY3RsLmM6NzE4Cj4+IMKgwqDCoMKgIFs8MDAwMDAwMDA0OWMxZjU0Nz5dIGRv
X3N5c2NhbGxfNjQrMHg3Ni8weDFhMCAKPj4gYXJjaC94ODYvZW50cnkvY29tbW9uLmM6MzAxCj4+
IMKgwqDCoMKgIFs8MDAwMDAwMDAyOWNjOGNhNz5dIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdm
cmFtZSsweDQ0LzB4YTkKPj4KPj4KPj4KPj4gLS0tCj4+IFRoaXMgYnVnIGlzIGdlbmVyYXRlZCBi
eSBhIGJvdC4gSXQgbWF5IGNvbnRhaW4gZXJyb3JzLgo+PiBTZWUgaHR0cHM6Ly9nb28uZ2wvdHBz
bUVKIGZvciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHN5emJvdC4KPj4gc3l6Ym90IGVuZ2luZWVy
cyBjYW4gYmUgcmVhY2hlZCBhdCBzeXprYWxsZXJAZ29vZ2xlZ3JvdXBzLmNvbS4KPj4KPj4gc3l6
Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGJ1ZyByZXBvcnQuIFNlZToKPj4gaHR0cHM6Ly9n
b28uZ2wvdHBzbUVKI3N0YXR1cyBmb3IgaG93IHRvIGNvbW11bmljYXRlIHdpdGggc3l6Ym90Lgo+
PiBzeXpib3QgY2FuIHRlc3QgcGF0Y2hlcyBmb3IgdGhpcyBidWcsIGZvciBkZXRhaWxzIHNlZToK
Pj4gaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3Rlc3RpbmctcGF0Y2hlcwo+Pgo+IElnbm9yZSBteSBu
b2lzZSBpZiB5b3UgaGF2ZSBubyBpbnRlcmVzdCBzZWVpbmcgdGhlIHN5emJvdCByZXBvcnQuCj4K
PiBBZnRlciBjb21taXQgYzM4ZTM5YzM3OGY0NmYgKCJ2aG9zdC1uZXQ6IGZpeCB1c2UtYWZ0ZXIt
ZnJlZSBpbgo+IHZob3N0X25ldF9mbHVzaCIpIGZsdXNoIHdvdWxkIG5vIGxvbmdlciBmcmVlIHVi
dWYsIGp1c3Qgd2FpdCB1bnRpbCAKPiB1YnVmIHVzZXJzCj4gZGlzYXBwZWFyIGluc3RlYWQuCj4K
PiBUaGUgZm9sbG93aW5nIGRpZmYsIGluIGhvcGUgdGhhdCBtYXkgcGVyaGFwcyBoZWxwIHlvdSBo
YW5kbGUgdGhlIAo+IG1lbW9yeSBsZWFrLAo+IG1ha2VzIGZsdXNoIGFibGUgdG8gZnJlZSB1YnVm
IGluIHRoZSBwYXRoIG9mIGZpbGUgcmVsZWFzZS4KPgo+IFRoYW5rcwo+IEhpbGxmCj4gLS0tCj4g
ZHJpdmVycy92aG9zdC9uZXQuYyB8IDggKysrKysrKy0KPiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9u
ZXQuYyBiL2RyaXZlcnMvdmhvc3QvbmV0LmMKPiBpbmRleCAzYmViNDAxLi5kY2YyMGI2IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvbmV0LmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L25ldC5j
Cj4gQEAgLTE0MSw2ICsxNDEsNyBAQCBzdHJ1Y3Qgdmhvc3RfbmV0IHsKPiDCoMKgwqDCoHVuc2ln
bmVkIHR4X3pjb3B5X2VycjsKPiDCoMKgwqDCoC8qIEZsdXNoIGluIHByb2dyZXNzLiBQcm90ZWN0
ZWQgYnkgdHggdnEgbG9jay4gKi8KPiDCoMKgwqDCoGJvb2wgdHhfZmx1c2g7Cj4gK8KgwqDCoCBi
b29sIGxkO8KgwqDCoCAvKiBMYXN0IGRpbm5lciAqLwo+IMKgwqDCoMKgLyogUHJpdmF0ZSBwYWdl
IGZyYWcgKi8KPiDCoMKgwqDCoHN0cnVjdCBwYWdlX2ZyYWcgcGFnZV9mcmFnOwo+IMKgwqDCoMKg
LyogUmVmY291bnQgYmlhcyBvZiBwYWdlIGZyYWcgKi8KPiBAQCAtMTI4Myw2ICsxMjg0LDcgQEAg
c3RhdGljIGludCB2aG9zdF9uZXRfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCAKPiBzdHJ1Y3Qg
ZmlsZSAqZikKPiDCoMKgwqDCoG4gPSBrdm1hbGxvYyhzaXplb2YgKm4sIEdGUF9LRVJORUwgfCBf
X0dGUF9SRVRSWV9NQVlGQUlMKTsKPiDCoMKgwqDCoGlmICghbikKPiDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT01FTTsKPiArwqDCoMKgIG4tPmxkID0gZmFsc2U7Cj4gwqDCoMKgwqB2cXMgPSBr
bWFsbG9jX2FycmF5KFZIT1NUX05FVF9WUV9NQVgsIHNpemVvZigqdnFzKSwgR0ZQX0tFUk5FTCk7
Cj4gwqDCoMKgwqBpZiAoIXZxcykgewo+IMKgwqDCoMKgwqDCoMKgIGt2ZnJlZShuKTsKPiBAQCAt
MTM3Niw3ICsxMzc4LDEwIEBAIHN0YXRpYyB2b2lkIHZob3N0X25ldF9mbHVzaChzdHJ1Y3Qgdmhv
c3RfbmV0ICpuKQo+IMKgwqDCoMKgwqDCoMKgIG4tPnR4X2ZsdXNoID0gdHJ1ZTsKPiDCoMKgwqDC
oMKgwqDCoCBtdXRleF91bmxvY2soJm4tPnZxc1tWSE9TVF9ORVRfVlFfVFhdLnZxLm11dGV4KTsK
PiDCoMKgwqDCoMKgwqDCoCAvKiBXYWl0IGZvciBhbGwgbG93ZXIgZGV2aWNlIERNQXMgZG9uZS4g
Ki8KPiAtIHZob3N0X25ldF91YnVmX3B1dF9hbmRfd2FpdChuLT52cXNbVkhPU1RfTkVUX1ZRX1RY
XS51YnVmcyk7Cj4gK8KgwqDCoMKgwqDCoMKgIGlmIChuLT5sZCkKPiArIHZob3N0X25ldF91YnVm
X3B1dF93YWl0X2FuZF9mcmVlKG4tPnZxc1tWSE9TVF9ORVRfVlFfVFhdLnVidWZzKTsKPiArwqDC
oMKgwqDCoMKgwqAgZWxzZQo+ICsgdmhvc3RfbmV0X3VidWZfcHV0X2FuZF93YWl0KG4tPnZxc1tW
SE9TVF9ORVRfVlFfVFhdLnVidWZzKTsKPiDCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZuLT52
cXNbVkhPU1RfTkVUX1ZRX1RYXS52cS5tdXRleCk7Cj4gwqDCoMKgwqDCoMKgwqAgbi0+dHhfZmx1
c2ggPSBmYWxzZTsKPiBhdG9taWNfc2V0KCZuLT52cXNbVkhPU1RfTkVUX1ZRX1RYXS51YnVmcy0+
cmVmY291bnQsIDEpOwo+IEBAIC0xNDAzLDYgKzE0MDgsNyBAQCBzdGF0aWMgaW50IHZob3N0X25l
dF9yZWxlYXNlKHN0cnVjdCBpbm9kZSAKPiAqaW5vZGUsIHN0cnVjdCBmaWxlICpmKQo+IMKgwqDC
oMKgc3luY2hyb25pemVfcmN1KCk7Cj4gwqDCoMKgwqAvKiBXZSBkbyBhbiBleHRyYSBmbHVzaCBi
ZWZvcmUgZnJlZWluZyBtZW1vcnksCj4gwqDCoMKgwqAgKiBzaW5jZSBqb2JzIGNhbiByZS1xdWV1
ZSB0aGVtc2VsdmVzLiAqLwo+ICvCoMKgwqAgbi0+bGQgPSB0cnVlOwo+IMKgwqDCoMKgdmhvc3Rf
bmV0X2ZsdXNoKG4pOwo+IMKgwqDCoMKga2ZyZWUobi0+dnFzW1ZIT1NUX05FVF9WUV9SWF0ucnhx
LnF1ZXVlKTsKPiDCoMKgwqDCoGtmcmVlKG4tPnZxc1tWSE9TVF9ORVRfVlFfVFhdLnhkcCk7Cj4g
LS0gCgoKVGhpcyBpcyBiYXNpY2FsbHkgYSBrZnJlZSh1YnVmKSBhZnRlciB0aGUgc2Vjb25kIHZo
b3N0X25ldF9mbHVzaCgpIGluIAp2aG9zdF9uZXRfcmVsZWFzZSgpLgoKQ291bGQgeW91IHBsZWFz
ZSBwb3N0IGEgZm9ybWFsIHBhdGNoPwoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
