Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BD1B3A2
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 12:05:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F425D3E;
	Mon, 13 May 2019 10:05:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 090FEBA4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:05:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9A8C742D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:05:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1493D3082E1E;
	Mon, 13 May 2019 10:05:13 +0000 (UTC)
Received: from [10.72.12.49] (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE306A96C;
	Mon, 13 May 2019 10:05:03 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] vsock/virtio: make the RX buffer size tunable
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-9-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eddb5a89-ed44-3a65-0181-84f7f27dd2cb@redhat.com>
Date: Mon, 13 May 2019 18:05:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510125843.95587-9-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 13 May 2019 10:05:13 +0000 (UTC)
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

Ck9uIDIwMTkvNS8xMCDkuIvljYg4OjU4LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gVGhl
IFJYIGJ1ZmZlciBzaXplIGRldGVybWluZXMgdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBvZiB0aGUK
PiB2c29jay92aXJ0aW8gZ3Vlc3QgZHJpdmVyLCBzbyB3ZSBtYWtlIGl0IHR1bmFibGUgdGhyb3Vn
aAo+IGEgbW9kdWxlIHBhcmFtZXRlci4KPgo+IFRoZSBzaXplIGFsbG93ZWQgYXJlIGJldHdlZW4g
NCBLQiBhbmQgNjQgS0IgaW4gb3JkZXIgdG8gYmUKPiBjb21wYXRpYmxlIHdpdGggb2xkIGhvc3Qg
ZHJpdmVycy4KPgo+IFN1Z2dlc3RlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnphcmVAcmVk
aGF0LmNvbT4KCgpJIGRvbid0IHNlZSBtdWNoIHZhbHVlIG9mIGRvaW5nIHRoaXMgdGhyb3VnaCBr
ZXJuZWwgY29tbWFuZCBsaW5lLiBXZSAKc2hvdWxkIGRlYWwgd2l0aCB0aGVtIGF1dG9tYXRpY2Fs
bHkgbGlrZSB3aGF0IHZpcnRpby1uZXQgZGlkLiBPciBldmVuIGEgCm1vZHVsZSBwYXJhbWV0ZXIg
aXMgYmV0dGVyLgoKVGhhbmtzCgoKPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvdmlydGlvX3Zzb2Nr
LmggICAgIHwgIDEgKwo+ICAgbmV0L3Ztd192c29jay92aXJ0aW9fdHJhbnNwb3J0LmMgfCAyNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdmly
dGlvX3Zzb2NrLmggYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oCj4gaW5kZXggNWE5ZDI1
YmU3MmRmLi5iOWY4YzNkOTFmODAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9f
dnNvY2suaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmgKPiBAQCAtMTMsNiAr
MTMsNyBAQAo+ICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfREVGQVVMVF9SWF9CVUZfU0laRQkoMTAy
NCAqIDY0KQo+ICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfTUFYX0JVRl9TSVpFCQkweEZGRkZGRkZG
VUwKPiAgICNkZWZpbmUgVklSVElPX1ZTT0NLX01BWF9QS1RfQlVGX1NJWkUJCSgxMDI0ICogNjQp
Cj4gKyNkZWZpbmUgVklSVElPX1ZTT0NLX01JTl9QS1RfQlVGX1NJWkUJCSgxMDI0ICogNCkKPiAg
IAo+ICAgZW51bSB7Cj4gICAJVlNPQ0tfVlFfUlggICAgID0gMCwgLyogZm9yIGhvc3QgdG8gZ3Vl
c3QgZGF0YSAqLwo+IGRpZmYgLS1naXQgYS9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnQu
YyBiL25ldC92bXdfdnNvY2svdmlydGlvX3RyYW5zcG9ydC5jCj4gaW5kZXggYWYxZDJjZTEyZjU0
Li43MzIzOThiNGUyOGYgMTAwNjQ0Cj4gLS0tIGEvbmV0L3Ztd192c29jay92aXJ0aW9fdHJhbnNw
b3J0LmMKPiArKysgYi9uZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnQuYwo+IEBAIC02Niw2
ICs2NiwzMSBAQCBzdHJ1Y3QgdmlydGlvX3Zzb2NrIHsKPiAgIAl1MzIgZ3Vlc3RfY2lkOwo+ICAg
fTsKPiAgIAo+ICtzdGF0aWMgdW5zaWduZWQgaW50IHJ4X2J1Zl9zaXplID0gVklSVElPX1ZTT0NL
X0RFRkFVTFRfUlhfQlVGX1NJWkU7Cj4gKwo+ICtzdGF0aWMgaW50IHBhcmFtX3NldF9yeF9idWZf
c2l6ZShjb25zdCBjaGFyICp2YWwsIGNvbnN0IHN0cnVjdCBrZXJuZWxfcGFyYW0gKmtwKQo+ICt7
Cj4gKwl1bnNpZ25lZCBpbnQgc2l6ZTsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0ga3N0cnRv
dWludCh2YWwsIDAsICZzaXplKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4g
KwlpZiAoc2l6ZSA8IFZJUlRJT19WU09DS19NSU5fUEtUX0JVRl9TSVpFIHx8Cj4gKwkgICAgc2l6
ZSA+IFZJUlRJT19WU09DS19NQVhfUEtUX0JVRl9TSVpFKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+
ICsKPiArCXJldHVybiBwYXJhbV9zZXRfdWludCh2YWwsIGtwKTsKPiArfTsKPiArCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtX29wcyBwYXJhbV9vcHNfcnhfYnVmX3NpemUgPSB7
Cj4gKwkuc2V0ID0gcGFyYW1fc2V0X3J4X2J1Zl9zaXplLAo+ICsJLmdldCA9IHBhcmFtX2dldF91
aW50LAo+ICt9Owo+ICsKPiArbW9kdWxlX3BhcmFtX2NiKHJ4X2J1Zl9zaXplLCAmcGFyYW1fb3Bz
X3J4X2J1Zl9zaXplLCAmcnhfYnVmX3NpemUsIDA2NDQpOwo+ICsKPiAgIHN0YXRpYyBzdHJ1Y3Qg
dmlydGlvX3Zzb2NrICp2aXJ0aW9fdnNvY2tfZ2V0KHZvaWQpCj4gICB7Cj4gICAJcmV0dXJuIHRo
ZV92aXJ0aW9fdnNvY2s7Cj4gQEAgLTI2MSw3ICsyODYsNyBAQCB2aXJ0aW9fdHJhbnNwb3J0X2Nh
bmNlbF9wa3Qoc3RydWN0IHZzb2NrX3NvY2sgKnZzaykKPiAgIAo+ICAgc3RhdGljIHZvaWQgdmly
dGlvX3Zzb2NrX3J4X2ZpbGwoc3RydWN0IHZpcnRpb192c29jayAqdnNvY2spCj4gICB7Cj4gLQlp
bnQgYnVmX2xlbiA9IFZJUlRJT19WU09DS19ERUZBVUxUX1JYX0JVRl9TSVpFOwo+ICsJaW50IGJ1
Zl9sZW4gPSByeF9idWZfc2l6ZTsKPiAgIAlzdHJ1Y3QgdmlydGlvX3Zzb2NrX3BrdCAqcGt0Owo+
ICAgCXN0cnVjdCBzY2F0dGVybGlzdCBoZHIsIGJ1ZiwgKnNnc1syXTsKPiAgIAlzdHJ1Y3Qgdmly
dHF1ZXVlICp2cTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
