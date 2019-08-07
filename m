Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F9B84523
	for <lists.virtualization@lfdr.de>; Wed,  7 Aug 2019 09:06:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 29A3FE35;
	Wed,  7 Aug 2019 07:05:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 907CADD8
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 07:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4FE4F829
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 07:05:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D78E81F25;
	Wed,  7 Aug 2019 07:05:55 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3D841000324;
	Wed,  7 Aug 2019 07:05:50 +0000 (UTC)
Subject: Re: [PATCH V3 01/10] vhost: disable metadata prefetch optimization
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20190807065449.23373-1-jasowang@redhat.com>
	<20190807065449.23373-2-jasowang@redhat.com>
Message-ID: <a084127d-4acb-dceb-3bb6-617eb79734e4@redhat.com>
Date: Wed, 7 Aug 2019 15:05:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807065449.23373-2-jasowang@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 07 Aug 2019 07:05:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, jgg@ziepe.ca
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

Ck9uIDIwMTkvOC83IOS4i+WNiDI6NTQsIEphc29uIFdhbmcgd3JvdGU6Cj4gRnJvbTogIk1pY2hh
ZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+Cj4gVGhpcyBzZWVtcyB0byBjYXVzZSBn
dWVzdCBhbmQgaG9zdCBtZW1vcnkgY29ycnVwdGlvbi4KPiBEaXNhYmxlIGZvciBub3cgdW50aWwg
d2UgZ2V0IGEgYmV0dGVyIGhhbmRsZSBvbiB0aGF0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFl
bCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhv
c3QuaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaCBiL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuaAo+IGluZGV4IDgxOTI5NjMzMjkxMy4uNDJhOGMyYTEzYWIxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+
IEBAIC05Niw3ICs5Niw3IEBAIHN0cnVjdCB2aG9zdF91YWRkciB7Cj4gICB9Owo+ICAgCj4gICAj
aWYgZGVmaW5lZChDT05GSUdfTU1VX05PVElGSUVSKSAmJiBBUkNIX0lNUExFTUVOVFNfRkxVU0hf
RENBQ0hFX1BBR0UgPT0gMAo+IC0jZGVmaW5lIFZIT1NUX0FSQ0hfQ0FOX0FDQ0VMX1VBQ0NFU1Mg
MQo+ICsjZGVmaW5lIFZIT1NUX0FSQ0hfQ0FOX0FDQ0VMX1VBQ0NFU1MgMAo+ICAgI2Vsc2UKPiAg
ICNkZWZpbmUgVkhPU1RfQVJDSF9DQU5fQUNDRUxfVUFDQ0VTUyAwCj4gICAjZW5kaWYKCgpPb3Bz
LCB0aGlzIGlzIHVubmVjZXNzYXJ5LgoKV2lsbCBwb3N0IFY0LgoKVGhhbmtzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
