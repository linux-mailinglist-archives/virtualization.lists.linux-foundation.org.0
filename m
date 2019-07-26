Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBBD764F3
	for <lists.virtualization@lfdr.de>; Fri, 26 Jul 2019 13:57:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E305CAA;
	Fri, 26 Jul 2019 11:57:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 134B59EE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 11:57:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B5DF389C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 11:57:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3785183F4C;
	Fri, 26 Jul 2019 11:57:33 +0000 (UTC)
Received: from [10.72.12.238] (ovpn-12-238.pek2.redhat.com [10.72.12.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC5EA60C18;
	Fri, 26 Jul 2019 11:57:28 +0000 (UTC)
Subject: Re: [PATCH] vhost: disable metadata prefetch optimization
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20190726115021.7319-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ccba99c1-7708-3e55-6fc9-7775415c77a8@redhat.com>
Date: Fri, 26 Jul 2019 19:57:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726115021.7319-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 26 Jul 2019 11:57:33 +0000 (UTC)
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

Ck9uIDIwMTkvNy8yNiDkuIvljYg3OjUxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gVGhp
cyBzZWVtcyB0byBjYXVzZSBndWVzdCBhbmQgaG9zdCBtZW1vcnkgY29ycnVwdGlvbi4KPiBEaXNh
YmxlIGZvciBub3cgdW50aWwgd2UgZ2V0IGEgYmV0dGVyIGhhbmRsZSBvbiB0aGF0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPgo+
IEkgcHV0IHRoaXMgaW4gbGludXgtbmV4dCwgd2UnbGwgcmUtZW5hYmxlIGlmIHdlIGNhbiBmaXgK
PiB0aGUgb3V0c3RhbmRpbmcgaXNzdWVzIGluIGEgc2hvcnQgb3JkZXIuCgoKQnR3LCBpcyB0aGlz
IG1vcmUgc3VpdGFibGUgdG8gZS5nIHJldmVydCB0aGUgCjg0MmFhNjRlZGRhY2QyM2FkYzZlY2Ri
YzY5Y2IyMDMwYmVjNDcxMjIgYW5kIGxldCBzeXpib3QgZnV6eiBtb3JlIG9uIHRoZSAKY3VycmVu
dCBjb2RlPwoKSSB0aGluayB3ZSB3b24ndCBhY2NlcHQgdGhhdCBwYXRjaCBldmVudHVhbGx5LCBz
byBJIHN1c3BlY3Qgd2hhdCBzeXpib3QgCnJlcG9ydHMgdG9kYXkgaXMgYSBmYWxzZSBwb3NpdGl2
ZXMuCgpUaGFua3MKCgo+Cj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAyICstCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3Zob3N0L3Zob3N0LmggYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPiBpbmRleCA4
MTkyOTYzMzI5MTMuLjQyYThjMmExM2FiMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zo
b3N0LmgKPiArKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPiBAQCAtOTYsNyArOTYsNyBAQCBz
dHJ1Y3Qgdmhvc3RfdWFkZHIgewo+ICAgfTsKPiAgIAo+ICAgI2lmIGRlZmluZWQoQ09ORklHX01N
VV9OT1RJRklFUikgJiYgQVJDSF9JTVBMRU1FTlRTX0ZMVVNIX0RDQUNIRV9QQUdFID09IDAKPiAt
I2RlZmluZSBWSE9TVF9BUkNIX0NBTl9BQ0NFTF9VQUNDRVNTIDEKPiArI2RlZmluZSBWSE9TVF9B
UkNIX0NBTl9BQ0NFTF9VQUNDRVNTIDAKPiAgICNlbHNlCj4gICAjZGVmaW5lIFZIT1NUX0FSQ0hf
Q0FOX0FDQ0VMX1VBQ0NFU1MgMAo+ICAgI2VuZGlmCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
