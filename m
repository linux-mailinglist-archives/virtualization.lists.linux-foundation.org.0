Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F67D4CC
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 07:14:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E638E88F6;
	Thu,  1 Aug 2019 05:13:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5DB8A438E
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 05:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5F7D65F4
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 05:03:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7CC330044CC;
	Thu,  1 Aug 2019 05:03:31 +0000 (UTC)
Received: from [10.72.12.66] (ovpn-12-66.pek2.redhat.com [10.72.12.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 042175D9C9;
	Thu,  1 Aug 2019 05:03:25 +0000 (UTC)
Subject: Re: [PATCH V2 4/9] vhost: reset invalidate_count in
	vhost_set_vring_num_addr()
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-5-jasowang@redhat.com>
	<20190731124124.GD3946@ziepe.ca>
	<31ef9ed4-d74a-3454-a57d-fa843a3a802b@redhat.com>
	<20190731193252.GH3946@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0a4deb4e-92e8-44e1-b20e-05767641b6ba@redhat.com>
Date: Thu, 1 Aug 2019 13:03:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731193252.GH3946@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 01 Aug 2019 05:03:31 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

Ck9uIDIwMTkvOC8xIOS4iuWNiDM6MzIsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBXZWQs
IEp1bCAzMSwgMjAxOSBhdCAwOToyOToyOFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBP
biAyMDE5LzcvMzEg5LiL5Y2IODo0MSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24gV2Vk
LCBKdWwgMzEsIDIwMTkgYXQgMDQ6NDY6NTBBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+
PiBUaGUgdmhvc3Rfc2V0X3ZyaW5nX251bV9hZGRyKCkgY291bGQgYmUgY2FsbGVkIGluIHRoZSBt
aWRkbGUgb2YKPj4+PiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkgYW5kIGludmFsaWRhdGVfcmFu
Z2VfZW5kKCkuIElmIHdlIGRvbid0IHJlc2V0Cj4+Pj4gaW52YWxpZGF0ZV9jb3VudCBhZnRlciB0
aGUgdW4tcmVnaXN0ZXJpbmcgb2YgTU1VIG5vdGlmaWVyLCB0aGUKPj4+PiBpbnZhbGlkYXRlX2Nv
bnQgd2lsbCBydW4gb3V0IG9mIHN5bmMgKGUuZyBuZXZlciByZWFjaCB6ZXJvKS4gVGhpcyB3aWxs
Cj4+Pj4gaW4gZmFjdCBkaXNhYmxlIHRoZSBmYXN0IGFjY2Vzc29yIHBhdGguIEZpeGluZyBieSBy
ZXNldCB0aGUgY291bnQgdG8KPj4+PiB6ZXJvLgo+Pj4+Cj4+Pj4gUmVwb3J0ZWQtYnk6IE1pY2hh
ZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4+PiBEaWQgTWljaGFlbCByZXBvcnQgdGhp
cyBhcyB3ZWxsPwo+Pgo+PiBDb3JyZWN0IG1lIGlmIEkgd2FzIHdyb25nLiBJIHRoaW5rIGl0J3Mg
cG9pbnQgNCBkZXNjcmliZWQgaW4KPj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNy8yMS8y
NS4KPiBJJ20gbm90IHN1cmUgd2hhdCB0aGF0IGlzIHRhbGtpbmcgYWJvdXQKPgo+IEJ1dCB0aGlz
IGZpeGVzIHdoYXQgSSBkZXNjcmliZWQ6Cj4KPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS83
LzIyLzU1NAo+Cj4gSmFzb24KCgpJJ20gc29ycnkgSSBtaXNzIHRoaXMsIHdpbGwgYWRkIHlvdXIg
bmFtZSBhcyByZXBvcnRlZC1ieSBpbiB0aGUgbmV4dCAKdmVyc2lvbi4KClRoYW5rcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
