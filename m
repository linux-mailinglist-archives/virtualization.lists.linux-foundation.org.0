Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0081B38D
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 12:02:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CFCC2C3E;
	Mon, 13 May 2019 10:02:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F104FB9E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:02:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A3A8382C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:02:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 204F4307D854;
	Mon, 13 May 2019 10:02:04 +0000 (UTC)
Received: from [10.72.12.49] (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D31595D706;
	Mon, 13 May 2019 10:01:54 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] vsock/virtio: increase RX buffer size to 64 KiB
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-8-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bf0416f1-0e69-722d-75ce-3d101e6d7d71@redhat.com>
Date: Mon, 13 May 2019 18:01:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510125843.95587-8-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 13 May 2019 10:02:04 +0000 (UTC)
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

Ck9uIDIwMTkvNS8xMCDkuIvljYg4OjU4LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gSW4g
b3JkZXIgdG8gaW5jcmVhc2UgaG9zdCAtPiBndWVzdCB0aHJvdWdocHV0IHdpdGggbGFyZ2UgcGFj
a2V0cywKPiB3ZSBjYW4gdXNlIDY0IEtpQiBSWCBidWZmZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgo+IC0tLQo+ICAgaW5jbHVk
ZS9saW51eC92aXJ0aW9fdnNvY2suaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdmly
dGlvX3Zzb2NrLmggYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oCj4gaW5kZXggODRiNzIw
MjZkMzI3Li41YTlkMjViZTcyZGYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9f
dnNvY2suaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmgKPiBAQCAtMTAsNyAr
MTAsNyBAQAo+ICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfREVGQVVMVF9NSU5fQlVGX1NJWkUJMTI4
Cj4gICAjZGVmaW5lIFZJUlRJT19WU09DS19ERUZBVUxUX0JVRl9TSVpFCQkoMTAyNCAqIDI1NikK
PiAgICNkZWZpbmUgVklSVElPX1ZTT0NLX0RFRkFVTFRfTUFYX0JVRl9TSVpFCSgxMDI0ICogMjU2
KQo+IC0jZGVmaW5lIFZJUlRJT19WU09DS19ERUZBVUxUX1JYX0JVRl9TSVpFCSgxMDI0ICogNCkK
PiArI2RlZmluZSBWSVJUSU9fVlNPQ0tfREVGQVVMVF9SWF9CVUZfU0laRQkoMTAyNCAqIDY0KQo+
ICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfTUFYX0JVRl9TSVpFCQkweEZGRkZGRkZGVUwKPiAgICNk
ZWZpbmUgVklSVElPX1ZTT0NLX01BWF9QS1RfQlVGX1NJWkUJCSgxMDI0ICogNjQpCj4gICAKCgpX
ZSBwcm9iYWJseSBkb24ndCB3YW50IHN1Y2ggaGlnaCBvcmRlciBhbGxvY2F0aW9uLiBJdCdzIGJl
dHRlciB0byBzd2l0Y2ggCnRvIHVzZSBvcmRlciAwIHBhZ2VzIGluIHRoaXMgY2FzZS4gU2VlIGFk
ZF9yZWN2YnVmX2JpZygpIGZvciB2aXJ0aW8tbmV0LiAKSWYgd2UgZ2V0IGRhdGFwYXRoIHVuaWZp
ZWQsIHdlIHdpbGwgZ2V0IG1vcmUgc3R1ZmZzIHNldC4KClRoYW5rcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
