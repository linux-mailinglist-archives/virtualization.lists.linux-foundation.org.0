Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76559559346
	for <lists.virtualization@lfdr.de>; Fri, 24 Jun 2022 08:23:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 693BB4064C;
	Fri, 24 Jun 2022 06:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 693BB4064C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzYuVFui
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvdyTZF2Crrh; Fri, 24 Jun 2022 06:23:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 981974032E;
	Fri, 24 Jun 2022 06:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 981974032E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7BDCC0081;
	Fri, 24 Jun 2022 06:23:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48415C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29691612BA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29691612BA
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=GzYuVFui
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrLjdu4nd-jB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:23:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB4BD612A9
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB4BD612A9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 06:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656051799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/ivYxAMfggPbkQhef/AlBbsVkIIj7YA57YGPWnP6cg=;
 b=GzYuVFuiILJzJ9eJRfk/VyWM0GD6FFrCO+32q80B1FnQLgCU3Ki/BrDNudLajdxRxaWANH
 /rYQnKIeaOmeg7F6XXg9E+8qUJ42Bz6NaVzBZeOIbx14R+jb091Y60j+l1AAb76yL4Bc2v
 5OfUYmLGImJ7WKUrDSLLilR4vw9+6nA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-mNipAluVMRixzb-H3NJUWw-1; Fri, 24 Jun 2022 02:23:17 -0400
X-MC-Unique: mNipAluVMRixzb-H3NJUWw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h125-20020a1c2183000000b003a0374f1eb8so1479259wmh.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 23:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=e/ivYxAMfggPbkQhef/AlBbsVkIIj7YA57YGPWnP6cg=;
 b=pKFyktbg+/wU6Q4CfJYiNUrntnSVCzC1b5U9I8W9gT4mBiTpgYi+rEcRYkP4spytox
 rLY4r2OXSwy+epGf11fT9b0am+LkoJzahWRDbUVvK/6e9IPntT1M1ufgVBcrTU0q7YVE
 fU4fvVZlRyY10o11hl6nKWEhms/U6eCwfgzhVrA3YxB5/1G47YqU9CXzA9xzi8QU6m0/
 GdPkhKic6jkIdjRMwdHoGtdPGOW30/3h3PKcikvpP3d50eJW/w4Am8ugAqYVG2DLHwQg
 CHixjafhf5tSOHRe6qobKkshHX+HdXeSlE56HYxqAbELUVo5C5VjwP5Q64bph4lU57st
 3W1w==
X-Gm-Message-State: AJIora+hUIlMMRCzUR3yIcylUw2hRL1iK6HVK3XWDSUr+cw6hyDxgKvo
 gdlUBQmcVRgjeK/gUnAoPGjP0EPw4oQ0/K3uOqOfNhbSQLaSqImBVzbRLU7Z9+7lUwuoYgh/xsg
 AdPAPC5AvOaYVjyhBm7MbW7Z64bb43Ymp1JkW/2a+sg==
X-Received: by 2002:a1c:4d0a:0:b0:3a0:2d95:49d3 with SMTP id
 o10-20020a1c4d0a000000b003a02d9549d3mr1832914wmh.44.1656051796385; 
 Thu, 23 Jun 2022 23:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXk8MoM3bKuxlq8MYAnwn3uELmc7TcCW0NDyFVgA6fjBwDNdzTxw+OdBRVCVTmghHkUr8QeA==
X-Received: by 2002:a1c:4d0a:0:b0:3a0:2d95:49d3 with SMTP id
 o10-20020a1c4d0a000000b003a02d9549d3mr1832887wmh.44.1656051796045; 
 Thu, 23 Jun 2022 23:23:16 -0700 (PDT)
Received: from redhat.com ([2.55.188.216]) by smtp.gmail.com with ESMTPSA id
 l17-20020a5d5611000000b002101ed6e70fsm1350571wrv.37.2022.06.23.23.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 23:23:15 -0700 (PDT)
Date: Fri, 24 Jun 2022 02:23:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4] virtio_ring : keep used_wrap_counter in
 vq->last_used_idx
Message-ID: <20220624022136-mutt-send-email-mst@kernel.org>
References: <20220616101823-mutt-send-email-mst@kernel.org>
 <20220617020411.80367-1-huangjie.albert@bytedance.com>
 <CACGkMEutq89farjWTdPY8R8wq8gCJLU2SWJrv+x=pPA5fv6+Uw@mail.gmail.com>
 <20220622081543-mutt-send-email-mst@kernel.org>
 <CACGkMEtaAFN+ntKvbbGYNf2O_-wSgc+Z4VVETVBEBNJi4bz9oA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtaAFN+ntKvbbGYNf2O_-wSgc+Z4VVETVBEBNJi4bz9oA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Albert Huang <huangjie.albert@bytedance.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, yuanzhu@bytedance.com,
 virtualization <virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBKdW4gMjMsIDIwMjIgYXQgMDk6MzA6NDdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiBXZWQsIEp1biAyMiwgMjAyMiBhdCA4OjE2IFBNIE1pY2hhZWwgUy4gVHNpcmtpbiA8
bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgSnVuIDIyLCAyMDIyIGF0IDA0
OjUxOjIyUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgSnVuIDE3LCAy
MDIyIGF0IDEwOjA0IEFNIEFsYmVydCBIdWFuZwo+ID4gPiA8aHVhbmdqaWUuYWxiZXJ0QGJ5dGVk
YW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gRnJvbTogImh1YW5namllLmFsYmVydCIg
PGh1YW5namllLmFsYmVydEBieXRlZGFuY2UuY29tPgo+ID4gPiA+Cj4gPiA+ID4gdGhlIHVzZWRf
d3JhcF9jb3VudGVyIGFuZCB0aGUgdnEtPmxhc3RfdXNlZF9pZHggbWF5IGdldAo+ID4gPiA+IG91
dCBvZiBzeW5jIGlmIHRoZXkgYXJlIHNlcGFyYXRlIGFzc2lnbm1lbnTvvIxhbmQgaW50ZXJydXB0
Cj4gPiA+ID4gbWlnaHQgdXNlIGFuIGluY29ycmVjdCB2YWx1ZSB0byBjaGVjayBmb3IgdGhlIHVz
ZWQgaW5kZXguCj4gPiA+ID4KPiA+ID4gPiBmb3IgZXhhbXBsZTpPT0IgYWNjZXNzCj4gPiA+ID4g
a3NvZnRpcnFkIG1heSBjb25zdW1lIHRoZSBwYWNrZXQgYW5kIGl0IHdpbGwgY2FsbDoKPiA+ID4g
PiB2aXJ0bmV0X3BvbGwKPiA+ID4gPiAgICAgICAgIC0tPnZpcnRuZXRfcmVjZWl2ZQo+ID4gPiA+
ICAgICAgICAgICAgICAgICAtLT52aXJ0cXVldWVfZ2V0X2J1Zl9jdHgKPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAtLT52aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2VkCj4gPiA+ID4g
YW5kIGluIHZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQ6Cj4gPiA+ID4KPiA+ID4gPiB2cS0+
bGFzdF91c2VkX2lkeCArPSB2cS0+cGFja2VkLmRlc2Nfc3RhdGVbaWRdLm51bTsKPiA+ID4gPiBp
ZiAodW5saWtlbHkodnEtPmxhc3RfdXNlZF9pZHggPj0gdnEtPnBhY2tlZC52cmluZy5udW0pKSB7
Cj4gPiA+ID4gICAgICAgICAgdnEtPmxhc3RfdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmluZy5u
dW07Cj4gPiA+ID4gICAgICAgICAgdnEtPnBhY2tlZC51c2VkX3dyYXBfY291bnRlciBePSAxOwo+
ID4gPiA+IH0KPiA+ID4gPgo+ID4gPiA+IGlmIGF0IHRoZSBzYW1lIHRpbWUsIHRoZXJlIGNvbWVz
IGEgdnJpbmcgaW50ZXJydXB077yMaW4gdnJpbmdfaW50ZXJydXB0Ogo+ID4gPiA+IHdlIHdpbGwg
Y2FsbDoKPiA+ID4gPiB2cmluZ19pbnRlcnJ1cHQKPiA+ID4gPiAgICAgICAgIC0tPm1vcmVfdXNl
ZAo+ID4gPiA+ICAgICAgICAgICAgICAgICAtLT5tb3JlX3VzZWRfcGFja2VkCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgLS0+aXNfdXNlZF9kZXNjX3BhY2tlZAo+ID4gPiA+IGluIGlz
X3VzZWRfZGVzY19wYWNrZWQsIHRoZSBsYXN0X3VzZWRfaWR4IG1heWJlID49IHZxLT5wYWNrZWQu
dnJpbmcubnVtLgo+ID4gPiA+IHNvIHRoaXMgY291bGQgY2FzZSBhIG1lbW9yeSBvdXQgb2YgYm91
bmRzIGJ1Zy4KPiA+ID4gPgo+ID4gPiA+IHRoaXMgcGF0Y2ggaXMgdG8ga2VlcCB0aGUgdXNlZF93
cmFwX2NvdW50ZXIgaW4gdnEtPmxhc3RfdXNlZF9pZHgKPiA+ID4gPiBzbyB3ZSBjYW4gZ2V0IHRo
ZSBjb3JyZWN0IHZhbHVlIHRvIGNoZWNrIGZvciB1c2VkIGluZGV4IGluIGludGVycnVwdC4KPiA+
ID4gPgo+ID4gPiA+IHYzLT52NDoKPiA+ID4gPiAtIHVzZSBSRUFEX09OQ0UvV1JJVEVfT05DRSB0
byBnZXQvc2V0IHZxLT5sYXN0X3VzZWRfaWR4Cj4gPiA+ID4KPiA+ID4gPiB2Mi0+djM6Cj4gPiA+
ID4gLSBhZGQgaW5saW5lIGZ1bmN0aW9uIHRvIGdldCB1c2VkX3dyYXBfY291bnRlciBhbmQgbGFz
dF91c2VkCj4gPiA+ID4gLSB3aGVuIHVzZSB2cS0+bGFzdF91c2VkX2lkeCwgb25seSByZWFkIG9u
Y2UKPiA+ID4gPiAgIGlmIHZxLT5sYXN0X3VzZWRfaWR4IGlzIHJlYWQgdHdpY2UsIHRoZSB2YWx1
ZXMgY2FuIGJlIGluY29uc2lzdGVudC4KPiA+ID4gPiAtIHVzZSBsYXN0X3VzZWRfaWR4ICYgfigt
KDEgPDwgVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpKQo+ID4gPiA+ICAgdG8gZ2V0IHRo
ZSBhbGwgYml0cyBiZWxvdyBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUgo+ID4gPiA+Cj4g
PiA+ID4gdjEtPnYyOgo+ID4gPiA+IC0gcmV1c2UgdGhlIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dS
QVBfQ1RSCj4gPiA+ID4gLSBSZW1vdmUgcGFyYW1ldGVyIGp1ZGdtZW50IGluIGlzX3VzZWRfZGVz
Y19wYWNrZWQsCj4gPiA+ID4gYmVjYXVzZSBpdCBjYW4ndCBiZSBpbGxlZ2FsCj4gPiA+ID4KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBodWFuZ2ppZS5hbGJlcnQgPGh1YW5namllLmFsYmVydEBieXRl
ZGFuY2UuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmlu
Zy5jIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPiA+ID4gPgo+
ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4gPiA+IGluZGV4IDEzYTczNDhjZWRmZi4uNzE5ZmJi
ZTcxNmQ2IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMK
PiA+ID4gPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiA+ID4gQEAgLTEx
MSw3ICsxMTEsMTIgQEAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSB7Cj4gPiA+ID4gICAgICAgICAv
KiBOdW1iZXIgd2UndmUgYWRkZWQgc2luY2UgbGFzdCBzeW5jLiAqLwo+ID4gPiA+ICAgICAgICAg
dW5zaWduZWQgaW50IG51bV9hZGRlZDsKPiA+ID4gPgo+ID4gPiA+IC0gICAgICAgLyogTGFzdCB1
c2VkIGluZGV4IHdlJ3ZlIHNlZW4uICovCj4gPiA+ID4gKyAgICAgICAvKiBMYXN0IHVzZWQgaW5k
ZXggIHdlJ3ZlIHNlZW4uCj4gPiA+ID4gKyAgICAgICAgKiBmb3Igc3BsaXQgcmluZywgaXQganVz
dCBjb250YWlucyBsYXN0IHVzZWQgaW5kZXgKPiA+ID4gPiArICAgICAgICAqIGZvciBwYWNrZWQg
cmluZzoKPiA+ID4gPiArICAgICAgICAqIGJpdHMgdXAgdG8gVlJJTkdfUEFDS0VEX0VWRU5UX0Zf
V1JBUF9DVFIgaW5jbHVkZSB0aGUgbGFzdCB1c2VkIGluZGV4Lgo+ID4gPiA+ICsgICAgICAgICog
Yml0cyBmcm9tIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSIGluY2x1ZGUgdGhlIHVzZWQg
d3JhcCBjb3VudGVyLgo+ID4gPiA+ICsgICAgICAgICovCj4gPiA+ID4gICAgICAgICB1MTYgbGFz
dF91c2VkX2lkeDsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgLyogSGludCBmb3IgZXZlbnQgaWR4
OiBhbHJlYWR5IHRyaWdnZXJlZCBubyBuZWVkIHRvIGRpc2FibGUuICovCj4gPiA+ID4gQEAgLTE1
NCw5ICsxNTksNiBAQCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlIHsKPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiBEcml2ZXIgcmluZyB3cmFwIGNvdW50ZXIuICovCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBhdmFpbF93cmFwX2NvdW50ZXI7Cj4gPiA+ID4KPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAvKiBEZXZpY2UgcmluZyB3cmFwIGNvdW50ZXIu
ICovCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB1c2VkX3dyYXBfY291bnRl
cjsKPiA+ID4gPiAtCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLyogQXZhaWwgdXNl
ZCBmbGFncy4gKi8KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICB1MTYgYXZhaWxfdXNl
ZF9mbGFnczsKPiA+ID4gPgo+ID4gPiA+IEBAIC05NzMsNiArOTc1LDE1IEBAIHN0YXRpYyBzdHJ1
Y3QgdmlydHF1ZXVlICp2cmluZ19jcmVhdGVfdmlydHF1ZXVlX3NwbGl0KAo+ID4gPiA+ICAvKgo+
ID4gPiA+ICAgKiBQYWNrZWQgcmluZyBzcGVjaWZpYyBmdW5jdGlvbnMgLSAqX3BhY2tlZCgpLgo+
ID4gPiA+ICAgKi8KPiA+ID4gPiArc3RhdGljIGlubGluZSBib29sIHBhY2tlZF91c2VkX3dyYXBf
Y291bnRlcih1MTYgbGFzdF91c2VkX2lkeCkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgICAgcmV0
dXJuICEhKGxhc3RfdXNlZF9pZHggJiAoMSA8PCBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NU
UikpOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIHUxNiBwYWNr
ZWRfbGFzdF91c2VkKHUxNiBsYXN0X3VzZWRfaWR4KQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAg
ICByZXR1cm4gbGFzdF91c2VkX2lkeCAmIH4oLSgxIDw8IFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dS
QVBfQ1RSKSk7Cj4gPiA+ID4gK30KPiA+ID4KPiA+ID4gQW55IHJlYXNvbiB3ZSBuZWVkIGEgbWlu
dXMgYWZ0ZXIgdGhlIHNoaWZ0Pwo+ID4KPiA+IFRoZSBwb2ludCBpcyB0byBzYXkgImFsbCBiaXRz
IGFib3ZlIFZSSU5HX1BBQ0tFRF9FVkVOVF9GX1dSQVBfQ1RSIi4KPiA+IEhhcyBubyBlZmZlY3Qg
Y3VycmVudGx5IGJ1dCB3aWxsIGlmIGxhc3RfdXNlZF9pZHggaXMgZXh0ZW5kZWQgdG8gMzIgYml0
Lgo+IAo+IE9rLCBidXQgd2UgZG9uJ3QgZG8gdGhpcyBmb3Igb3RoZXIgdXNlcyBmb3IgVlJJTkdf
UEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIuCj4gCj4gSSB3b25kZXIgaG93IG11Y2ggdmFsdWUgd2Ug
ZG8gaXQgb25seSBoZXJlLgo+IAo+IFRoYW5rcwoKSSBkb24ndCBjYXJlIG11Y2ggZWl0aGVyIHdh
eS4gRmVlbCBmcmVlIHRvIGdvIGFoZWFkIGFuZCBwbGF5IHdpdGgKZGlmZmVyZW50IHZlcnNpb25z
IHNvIHNlZSB3aGljaCB3b3JrcyBiZXR0ZXIuCgo+ID4KPiA+Cj4gPiA+IE90aGVycyBsb29rIGdv
b2QuCj4gPiA+Cj4gPiA+IFRoYW5rcwo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gIHN0YXRpYyB2b2lk
IHZyaW5nX3VubWFwX2V4dHJhX3BhY2tlZChjb25zdCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2
cSwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZy
aW5nX2Rlc2NfZXh0cmEgKmV4dHJhKQo+ID4gPiA+IEBAIC0xNDA2LDggKzE0MTcsMTQgQEAgc3Rh
dGljIGlubGluZSBib29sIGlzX3VzZWRfZGVzY19wYWNrZWQoY29uc3Qgc3RydWN0IHZyaW5nX3Zp
cnRxdWV1ZSAqdnEsCj4gPiA+ID4KPiA+ID4gPiAgc3RhdGljIGlubGluZSBib29sIG1vcmVfdXNl
ZF9wYWNrZWQoY29uc3Qgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEpCj4gPiA+ID4gIHsKPiA+
ID4gPiAtICAgICAgIHJldHVybiBpc191c2VkX2Rlc2NfcGFja2VkKHZxLCB2cS0+bGFzdF91c2Vk
X2lkeCwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICB2cS0+cGFja2VkLnVzZWRfd3Jh
cF9jb3VudGVyKTsKPiA+ID4gPiArICAgICAgIHUxNiBsYXN0X3VzZWQ7Cj4gPiA+ID4gKyAgICAg
ICB1MTYgbGFzdF91c2VkX2lkeDsKPiA+ID4gPiArICAgICAgIGJvb2wgdXNlZF93cmFwX2NvdW50
ZXI7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgbGFzdF91c2VkX2lkeCA9IFJFQURfT05DRSh2
cS0+bGFzdF91c2VkX2lkeCk7Cj4gPiA+ID4gKyAgICAgICBsYXN0X3VzZWQgPSBwYWNrZWRfbGFz
dF91c2VkKGxhc3RfdXNlZF9pZHgpOwo+ID4gPiA+ICsgICAgICAgdXNlZF93cmFwX2NvdW50ZXIg
PSBwYWNrZWRfdXNlZF93cmFwX2NvdW50ZXIobGFzdF91c2VkX2lkeCk7Cj4gPiA+ID4gKyAgICAg
ICByZXR1cm4gaXNfdXNlZF9kZXNjX3BhY2tlZCh2cSwgbGFzdF91c2VkLCB1c2VkX3dyYXBfY291
bnRlcik7Cj4gPiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgdm9pZCAqdmlydHF1ZXVl
X2dldF9idWZfY3R4X3BhY2tlZChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiA+ID4gQEAgLTE0
MTUsNyArMTQzMiw4IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2Vk
KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICoqY3R4KQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAgICBz
dHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+ID4gPiA+IC0gICAgICAg
dTE2IGxhc3RfdXNlZCwgaWQ7Cj4gPiA+ID4gKyAgICAgICB1MTYgbGFzdF91c2VkLCBpZCwgbGFz
dF91c2VkX2lkeDsKPiA+ID4gPiArICAgICAgIGJvb2wgdXNlZF93cmFwX2NvdW50ZXI7Cj4gPiA+
ID4gICAgICAgICB2b2lkICpyZXQ7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIFNUQVJUX1VTRSh2
cSk7Cj4gPiA+ID4gQEAgLTE0MzQsNyArMTQ1Miw5IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVf
Z2V0X2J1Zl9jdHhfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiAgICAgICAg
IC8qIE9ubHkgZ2V0IHVzZWQgZWxlbWVudHMgYWZ0ZXIgdGhleSBoYXZlIGJlZW4gZXhwb3NlZCBi
eSBob3N0LiAqLwo+ID4gPiA+ICAgICAgICAgdmlydGlvX3JtYih2cS0+d2Vha19iYXJyaWVycyk7
Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgIGxhc3RfdXNlZCA9IHZxLT5sYXN0X3VzZWRfaWR4Owo+
ID4gPiA+ICsgICAgICAgbGFzdF91c2VkX2lkeCA9IFJFQURfT05DRSh2cS0+bGFzdF91c2VkX2lk
eCk7Cj4gPiA+ID4gKyAgICAgICB1c2VkX3dyYXBfY291bnRlciA9IHBhY2tlZF91c2VkX3dyYXBf
Y291bnRlcihsYXN0X3VzZWRfaWR4KTsKPiA+ID4gPiArICAgICAgIGxhc3RfdXNlZCA9IHBhY2tl
ZF9sYXN0X3VzZWQobGFzdF91c2VkX2lkeCk7Cj4gPiA+ID4gICAgICAgICBpZCA9IGxlMTZfdG9f
Y3B1KHZxLT5wYWNrZWQudnJpbmcuZGVzY1tsYXN0X3VzZWRdLmlkKTsKPiA+ID4gPiAgICAgICAg
ICpsZW4gPSBsZTMyX3RvX2NwdSh2cS0+cGFja2VkLnZyaW5nLmRlc2NbbGFzdF91c2VkXS5sZW4p
Owo+ID4gPiA+Cj4gPiA+ID4gQEAgLTE0NTEsMTIgKzE0NzEsMTUgQEAgc3RhdGljIHZvaWQgKnZp
cnRxdWV1ZV9nZXRfYnVmX2N0eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gPiA+
ICAgICAgICAgcmV0ID0gdnEtPnBhY2tlZC5kZXNjX3N0YXRlW2lkXS5kYXRhOwo+ID4gPiA+ICAg
ICAgICAgZGV0YWNoX2J1Zl9wYWNrZWQodnEsIGlkLCBjdHgpOwo+ID4gPiA+Cj4gPiA+ID4gLSAg
ICAgICB2cS0+bGFzdF91c2VkX2lkeCArPSB2cS0+cGFja2VkLmRlc2Nfc3RhdGVbaWRdLm51bTsK
PiA+ID4gPiAtICAgICAgIGlmICh1bmxpa2VseSh2cS0+bGFzdF91c2VkX2lkeCA+PSB2cS0+cGFj
a2VkLnZyaW5nLm51bSkpIHsKPiA+ID4gPiAtICAgICAgICAgICAgICAgdnEtPmxhc3RfdXNlZF9p
ZHggLT0gdnEtPnBhY2tlZC52cmluZy5udW07Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIHZxLT5w
YWNrZWQudXNlZF93cmFwX2NvdW50ZXIgXj0gMTsKPiA+ID4gPiArICAgICAgIGxhc3RfdXNlZCAr
PSB2cS0+cGFja2VkLmRlc2Nfc3RhdGVbaWRdLm51bTsKPiA+ID4gPiArICAgICAgIGlmICh1bmxp
a2VseShsYXN0X3VzZWQgPj0gdnEtPnBhY2tlZC52cmluZy5udW0pKSB7Cj4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGxhc3RfdXNlZCAtPSB2cS0+cGFja2VkLnZyaW5nLm51bTsKPiA+ID4gPiArICAg
ICAgICAgICAgICAgdXNlZF93cmFwX2NvdW50ZXIgXj0gMTsKPiA+ID4gPiAgICAgICAgIH0KPiA+
ID4gPgo+ID4gPiA+ICsgICAgICAgbGFzdF91c2VkID0gKGxhc3RfdXNlZCB8ICh1c2VkX3dyYXBf
Y291bnRlciA8PCBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUikpOwo+ID4gPiA+ICsgICAg
ICAgV1JJVEVfT05DRSh2cS0+bGFzdF91c2VkX2lkeCwgbGFzdF91c2VkKTsKPiA+ID4gPiArCj4g
PiA+ID4gICAgICAgICAvKgo+ID4gPiA+ICAgICAgICAgICogSWYgd2UgZXhwZWN0IGFuIGludGVy
cnVwdCBmb3IgdGhlIG5leHQgZW50cnksIHRlbGwgaG9zdAo+ID4gPiA+ICAgICAgICAgICogYnkg
d3JpdGluZyBldmVudCBpbmRleCBhbmQgZmx1c2ggb3V0IHRoZSB3cml0ZSBiZWZvcmUKPiA+ID4g
PiBAQCAtMTQ2NSw5ICsxNDg4LDcgQEAgc3RhdGljIHZvaWQgKnZpcnRxdWV1ZV9nZXRfYnVmX2N0
eF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLAo+ID4gPiA+ICAgICAgICAgaWYgKHZxLT5w
YWNrZWQuZXZlbnRfZmxhZ3Nfc2hhZG93ID09IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RFU0Mp
Cj4gPiA+ID4gICAgICAgICAgICAgICAgIHZpcnRpb19zdG9yZV9tYih2cS0+d2Vha19iYXJyaWVy
cywKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ2cS0+cGFja2VkLnZy
aW5nLmRyaXZlci0+b2ZmX3dyYXAsCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCB8Cj4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVy
IDw8Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWUklO
R19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUikpKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNwdV90b19sZTE2KHZxLT5sYXN0X3VzZWRfaWR4KSk7Cj4gPiA+ID4KPiA+
ID4gPiAgICAgICAgIExBU1RfQUREX1RJTUVfSU5WQUxJRCh2cSk7Cj4gPiA+ID4KPiA+ID4gPiBA
QCAtMTQ5OSw5ICsxNTIwLDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCB2aXJ0cXVldWVfZW5hYmxl
X2NiX3ByZXBhcmVfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiA+ID4gPgo+ID4gPiA+
ICAgICAgICAgaWYgKHZxLT5ldmVudCkgewo+ID4gPiA+ICAgICAgICAgICAgICAgICB2cS0+cGFj
a2VkLnZyaW5nLmRyaXZlci0+b2ZmX3dyYXAgPQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGNwdV90b19sZTE2KHZxLT5sYXN0X3VzZWRfaWR4IHwKPiA+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICh2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIDw8Cj4gPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVlJJTkdfUEFDS0VEX0VWRU5UX0Zf
V1JBUF9DVFIpKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBjcHVfdG9fbGUxNih2
cS0+bGFzdF91c2VkX2lkeCk7Cj4gPiA+ID4gICAgICAgICAgICAgICAgIC8qCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAqIFdlIG5lZWQgdG8gdXBkYXRlIGV2ZW50IG9mZnNldCBhbmQgZXZlbnQg
d3JhcAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiBjb3VudGVyIGZpcnN0IGJlZm9yZSB1cGRh
dGluZyBldmVudCBmbGFncy4KPiA+ID4gPiBAQCAtMTUxOCw4ICsxNTM3LDcgQEAgc3RhdGljIHVu
c2lnbmVkIGludCB2aXJ0cXVldWVfZW5hYmxlX2NiX3ByZXBhcmVfcGFja2VkKHN0cnVjdCB2aXJ0
cXVldWUgKl92cSkKPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgRU5E
X1VTRSh2cSk7Cj4gPiA+ID4gLSAgICAgICByZXR1cm4gdnEtPmxhc3RfdXNlZF9pZHggfCAoKHUx
Nil2cS0+cGFja2VkLnVzZWRfd3JhcF9jb3VudGVyIDw8Cj4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgVlJJTkdfUEFDS0VEX0VWRU5UX0ZfV1JBUF9DVFIpOwo+ID4gPiA+ICsgICAgICAg
cmV0dXJuIHZxLT5sYXN0X3VzZWRfaWR4Owo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAgc3Rh
dGljIGJvb2wgdmlydHF1ZXVlX3BvbGxfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSwgdTE2
IG9mZl93cmFwKQo+ID4gPiA+IEBAIC0xNTM3LDcgKzE1NTUsNyBAQCBzdGF0aWMgYm9vbCB2aXJ0
cXVldWVfcG9sbF9wYWNrZWQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxLCB1MTYgb2ZmX3dyYXApCj4g
PiA+ID4gIHN0YXRpYyBib29sIHZpcnRxdWV1ZV9lbmFibGVfY2JfZGVsYXllZF9wYWNrZWQoc3Ry
dWN0IHZpcnRxdWV1ZSAqX3ZxKQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgdnJp
bmdfdmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+ID4gPiA+IC0gICAgICAgdTE2IHVzZWRf
aWR4LCB3cmFwX2NvdW50ZXI7Cj4gPiA+ID4gKyAgICAgICB1MTYgdXNlZF9pZHgsIHdyYXBfY291
bnRlciwgbGFzdF91c2VkX2lkeDsKPiA+ID4gPiAgICAgICAgIHUxNiBidWZzOwo+ID4gPiA+Cj4g
PiA+ID4gICAgICAgICBTVEFSVF9VU0UodnEpOwo+ID4gPiA+IEBAIC0xNTUwLDkgKzE1NjgsMTAg
QEAgc3RhdGljIGJvb2wgdmlydHF1ZXVlX2VuYWJsZV9jYl9kZWxheWVkX3BhY2tlZChzdHJ1Y3Qg
dmlydHF1ZXVlICpfdnEpCj4gPiA+ID4gICAgICAgICBpZiAodnEtPmV2ZW50KSB7Cj4gPiA+ID4g
ICAgICAgICAgICAgICAgIC8qIFRPRE86IHR1bmUgdGhpcyB0aHJlc2hvbGQgKi8KPiA+ID4gPiAg
ICAgICAgICAgICAgICAgYnVmcyA9ICh2cS0+cGFja2VkLnZyaW5nLm51bSAtIHZxLT52cS5udW1f
ZnJlZSkgKiAzIC8gNDsKPiA+ID4gPiAtICAgICAgICAgICAgICAgd3JhcF9jb3VudGVyID0gdnEt
PnBhY2tlZC51c2VkX3dyYXBfY291bnRlcjsKPiA+ID4gPiArICAgICAgICAgICAgICAgbGFzdF91
c2VkX2lkeCA9IFJFQURfT05DRSh2cS0+bGFzdF91c2VkX2lkeCk7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICAgIHdyYXBfY291bnRlciA9IHBhY2tlZF91c2VkX3dyYXBfY291bnRlcihsYXN0X3VzZWRf
aWR4KTsKPiA+ID4gPgo+ID4gPiA+IC0gICAgICAgICAgICAgICB1c2VkX2lkeCA9IHZxLT5sYXN0
X3VzZWRfaWR4ICsgYnVmczsKPiA+ID4gPiArICAgICAgICAgICAgICAgdXNlZF9pZHggPSBwYWNr
ZWRfbGFzdF91c2VkKGxhc3RfdXNlZF9pZHgpICsgYnVmczsKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgaWYgKHVzZWRfaWR4ID49IHZxLT5wYWNrZWQudnJpbmcubnVtKSB7Cj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgdXNlZF9pZHggLT0gdnEtPnBhY2tlZC52cmluZy5udW07Cj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgd3JhcF9jb3VudGVyIF49IDE7Cj4gPiA+ID4gQEAg
LTE1ODIsOSArMTYwMSwxMCBAQCBzdGF0aWMgYm9vbCB2aXJ0cXVldWVfZW5hYmxlX2NiX2RlbGF5
ZWRfcGFja2VkKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiA+ID4gPiAgICAgICAgICAqLwo+ID4g
PiA+ICAgICAgICAgdmlydGlvX21iKHZxLT53ZWFrX2JhcnJpZXJzKTsKPiA+ID4gPgo+ID4gPiA+
IC0gICAgICAgaWYgKGlzX3VzZWRfZGVzY19wYWNrZWQodnEsCj4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2cS0+bGFzdF91c2VkX2lkeCwKPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZxLT5wYWNrZWQudXNlZF93cmFwX2NvdW50ZXIpKSB7Cj4g
PiA+ID4gKyAgICAgICBsYXN0X3VzZWRfaWR4ID0gUkVBRF9PTkNFKHZxLT5sYXN0X3VzZWRfaWR4
KTsKPiA+ID4gPiArICAgICAgIHdyYXBfY291bnRlciA9IHBhY2tlZF91c2VkX3dyYXBfY291bnRl
cihsYXN0X3VzZWRfaWR4KTsKPiA+ID4gPiArICAgICAgIHVzZWRfaWR4ID0gcGFja2VkX2xhc3Rf
dXNlZChsYXN0X3VzZWRfaWR4KTsKPiA+ID4gPiArICAgICAgIGlmIChpc191c2VkX2Rlc2NfcGFj
a2VkKHZxLCB1c2VkX2lkeCwgd3JhcF9jb3VudGVyKSkgewo+ID4gPiA+ICAgICAgICAgICAgICAg
ICBFTkRfVVNFKHZxKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4g
PiA+ICAgICAgICAgfQo+ID4gPiA+IEBAIC0xNjg5LDcgKzE3MDksNyBAQCBzdGF0aWMgc3RydWN0
IHZpcnRxdWV1ZSAqdnJpbmdfY3JlYXRlX3ZpcnRxdWV1ZV9wYWNrZWQoCj4gPiA+ID4gICAgICAg
ICB2cS0+bm90aWZ5ID0gbm90aWZ5Owo+ID4gPiA+ICAgICAgICAgdnEtPndlYWtfYmFycmllcnMg
PSB3ZWFrX2JhcnJpZXJzOwo+ID4gPiA+ICAgICAgICAgdnEtPmJyb2tlbiA9IHRydWU7Cj4gPiA+
ID4gLSAgICAgICB2cS0+bGFzdF91c2VkX2lkeCA9IDA7Cj4gPiA+ID4gKyAgICAgICB2cS0+bGFz
dF91c2VkX2lkeCA9IDAgfCAoMSA8PCBWUklOR19QQUNLRURfRVZFTlRfRl9XUkFQX0NUUik7Cj4g
PiA+ID4gICAgICAgICB2cS0+ZXZlbnRfdHJpZ2dlcmVkID0gZmFsc2U7Cj4gPiA+ID4gICAgICAg
ICB2cS0+bnVtX2FkZGVkID0gMDsKPiA+ID4gPiAgICAgICAgIHZxLT5wYWNrZWRfcmluZyA9IHRy
dWU7Cj4gPiA+ID4gQEAgLTE3MjAsNyArMTc0MCw2IEBAIHN0YXRpYyBzdHJ1Y3QgdmlydHF1ZXVl
ICp2cmluZ19jcmVhdGVfdmlydHF1ZXVlX3BhY2tlZCgKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAg
dnEtPnBhY2tlZC5uZXh0X2F2YWlsX2lkeCA9IDA7Cj4gPiA+ID4gICAgICAgICB2cS0+cGFja2Vk
LmF2YWlsX3dyYXBfY291bnRlciA9IDE7Cj4gPiA+ID4gLSAgICAgICB2cS0+cGFja2VkLnVzZWRf
d3JhcF9jb3VudGVyID0gMTsKPiA+ID4gPiAgICAgICAgIHZxLT5wYWNrZWQuZXZlbnRfZmxhZ3Nf
c2hhZG93ID0gMDsKPiA+ID4gPiAgICAgICAgIHZxLT5wYWNrZWQuYXZhaWxfdXNlZF9mbGFncyA9
IDEgPDwgVlJJTkdfUEFDS0VEX0RFU0NfRl9BVkFJTDsKPiA+ID4gPgo+ID4gPiA+IC0tCj4gPiA+
ID4gMi4zMS4xCj4gPiA+ID4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
