Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B36CD1AB
	for <lists.virtualization@lfdr.de>; Wed, 29 Mar 2023 07:34:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AC6160E6A;
	Wed, 29 Mar 2023 05:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC6160E6A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RORNJ5IS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q33ecWtiwGRs; Wed, 29 Mar 2023 05:34:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E0BF660E59;
	Wed, 29 Mar 2023 05:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0BF660E59
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3754BC008C;
	Wed, 29 Mar 2023 05:34:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61DD1C002F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 05:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D404408C6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 05:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D404408C6
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RORNJ5IS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vqv4ju0Ew07n
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 05:34:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 684E9400A4
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 684E9400A4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Mar 2023 05:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680068060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKYnXvCYab97RG66lZ81YPSbP8j646tw3OvcwjSJJ4U=;
 b=RORNJ5IS6b3CjlpZHGhVdjck6hqfBfCadVzHl1pfHsjsX2t0IJqF+HMExBAPylSs5gz/ET
 TqyNiaolIW1WiW3SFzj4AnKyjyjNLuEGRWDicIynp0ChAUQN4/tUXBuj4OWUCvJF2VJOHw
 gfBlSCq4mokVDj/PulrL2MYPmzKA61E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-a0NfLFgkNRGLu6BlZ17a4Q-1; Wed, 29 Mar 2023 01:34:16 -0400
X-MC-Unique: a0NfLFgkNRGLu6BlZ17a4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 p10-20020a05600c358a00b003edf7d484d4so7558909wmq.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Mar 2023 22:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680068056;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TKYnXvCYab97RG66lZ81YPSbP8j646tw3OvcwjSJJ4U=;
 b=vNd7TA97ZXJ+rRnVvesrRf2obJz5duLypQKXtpI/19v6wW99nc3d9by3avG+LElnLL
 0xXTLo/00Qv2Ba+WROQI5UyR1h7BeQE8bvSEwKNdREdpdv09dC+KvDSMsGryKliBQ+dT
 bf2MRKkmMSDqRskCD4qLMiedFg9qo2adY1mSD/GUZsjXT+NNCIxgi/frUP6vOen4wTUR
 ezS9CtY3XZ/9KjV47Zy/7h9hrwP7zmveln2Sn5D+Sk+o1mnqUlPIY+dqltSPjUWmopjX
 fbuzG6SkukEalGCTUfW4l/BUPQj/32lJbFOZa4rtv5jqL4GeL7vAfM65XiF6xtkKT0EU
 7drg==
X-Gm-Message-State: AAQBX9dTy0Jmt6o+BvcwFWZvC+6dqI0uOq22B6H0PXCaIRBmOG+IKaAN
 sBqGDRrfx7O8/YwnmPf9mg8EI+VIXkEzDNg80u0Q3NP8u1FqNuCCk8IgfF8MM/CnKAPmSIAsQoB
 irBdT4UMb9nhxR5g+Tiv+sUpPB+8aiE/NETK/AIEYAw==
X-Received: by 2002:a5d:570d:0:b0:2d8:1aff:813 with SMTP id
 a13-20020a5d570d000000b002d81aff0813mr13128450wrv.43.1680068055645; 
 Tue, 28 Mar 2023 22:34:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZXpaB1zzOrJRIrcFRm8e9P+85wO5jiKmHj4ONTexa4CS8h/FuQoFUC20/bE8USu/IjPBFshA==
X-Received: by 2002:a5d:570d:0:b0:2d8:1aff:813 with SMTP id
 a13-20020a5d570d000000b002d81aff0813mr13128432wrv.43.1680068055292; 
 Tue, 28 Mar 2023 22:34:15 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 j10-20020adff00a000000b002d1bfe3269esm29182858wro.59.2023.03.28.22.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 22:34:14 -0700 (PDT)
Date: Wed, 29 Mar 2023 01:34:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?utf-8?B?6buE5p2w?= <huangjie.albert@bytedance.com>
Subject: Re: [External] Re: 9p regression (Was: [PATCH v2] virtio_ring: don't
 update event idx on get_buf)
Message-ID: <20230329012908-mutt-send-email-mst@kernel.org>
References: <20230325105633.58592-1-huangjie.albert@bytedance.com>
 <ZCJNTBQLZeyLBKKB@codewreck.org>
 <CACGkMEt29t9CK2Muiuyb1s6p2AzgcMiD_z0NVFn1d+KEqBydug@mail.gmail.com>
 <CABKxMyPwuRb6p-oHxcQDhRtJv04=NDWvosNAp=epgvdrfCeveg@mail.gmail.com>
 <CACGkMEuukvjXBTDX2K9YLYmpHsqK96AiMK39gbm3+f_+kUydMQ@mail.gmail.com>
 <CABKxMyN0598wA6wHv5GkZC14znwp=OPo7u71_BizJfR+gUx4_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABKxMyN0598wA6wHv5GkZC14znwp=OPo7u71_BizJfR+gUx4_w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Van Hensbergen <ericvh@gmail.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Luis Chamberlain <mcgrof@kernel.org>, v9fs-developer@lists.sourceforge.net
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

T24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgMDU6MDk6MTlQTSArMDgwMCwg6buE5p2wIHdyb3RlOgo+
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IOS6jjIwMjPlubQz5pyIMjjml6Xlkajk
uowgMTE6NDDlhpnpgZPvvJoKPiA+Cj4gPiBPbiBUdWUsIE1hciAyOCwgMjAyMyBhdCAxMTowOeKA
r0FNIOm7hOadsCA8aHVhbmdqaWUuYWxiZXJ0QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiDkuo4yMDIz5bm0M+aciDI45pel
5ZGo5LqMIDEwOjU55YaZ6YGT77yaCj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIE1hciAyOCwgMjAy
MyBhdCAxMDoxM+KAr0FNIERvbWluaXF1ZSBNYXJ0aW5ldAo+ID4gPiA+IDxhc21hZGV1c0Bjb2Rl
d3JlY2sub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBNaWNoYWVsLCBBbGJlcnQs
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQWxiZXJ0IEh1YW5nIHdyb3RlIG9uIFNhdCwgTWFyIDI1LCAy
MDIzIGF0IDA2OjU2OjMzUE0gKzA4MDA6Cj4gPiA+ID4gPiA+IGluIHZpcnRpb19uZXQsIGlmIHdl
IGRpc2FibGUgdGhlIG5hcGlfdHgsIHdoZW4gd2UgdHJpZ2VyIGEgdHggaW50ZXJydXB0LAo+ID4g
PiA+ID4gPiB0aGUgdnEtPmV2ZW50X3RyaWdnZXJlZCB3aWxsIGJlIHNldCB0byB0cnVlLiBJdCB3
aWxsIG5vIGxvbmdlciBiZSBzZXQgdG8KPiA+ID4gPiA+ID4gZmFsc2UuIFVubGVzcyB3ZSBleHBs
aWNpdGx5IGNhbGwgdmlydHF1ZXVlX2VuYWJsZV9jYl9kZWxheWVkIG9yCj4gPiA+ID4gPiA+IHZp
cnRxdWV1ZV9lbmFibGVfY2JfcHJlcGFyZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIHBhdGNo
IChjb21taXRlZCBhcyAzNTM5NTc3MGY4MDMgKCJ2aXJ0aW9fcmluZzogZG9uJ3QgdXBkYXRlIGV2
ZW50Cj4gPiA+ID4gPiBpZHggb24gZ2V0X2J1ZiIpIGluIG5leHQtMjAyMzAzMjcgYXBwYXJlbnRs
eSBicmVha3MgOXAsIGFzIHJlcG9ydGVkIGJ5Cj4gPiA+ID4gPiBMdWlzIGluIGh0dHBzOi8vbGtt
bC5rZXJuZWwub3JnL3IvWkNJKzdXZzVPY2xTbEU4Y0Bib21iYWRpbC5pbmZyYWRlYWQub3JnCj4g
PiA+ID4gPgo+ID4gPiA+ID4gSSd2ZSBqdXN0IGhpdCBoYWQgYSBsb29rIGF0IHJlY2VudCBwYXRj
aGVzWzFdIGFuZCByZXZlcnRlZCB0aGlzIHRvIHRlc3QKPiA+ID4gPiA+IGFuZCBJIGNhbiBtb3Vu
dCBhZ2Fpbiwgc28gSSdtIHByZXR0eSBzdXJlIHRoaXMgaXMgdGhlIGN1bHByaXQsIGJ1dCBJCj4g
PiA+ID4gPiBkaWRuJ3QgbG9vayBhdCB0aGUgY29udGVudCBhdCBhbGwgeWV0IHNvIGNhbm5vdCBh
ZHZpc2UgZnVydGhlci4KPiA+ID4gPiA+IEl0IG1pZ2h0IHZlcnkgd2VsbCBiZSB0aGF0IHdlIG5l
ZWQgc29tZSBleHRyYSBoYW5kbGluZyBmb3IgOXAKPiA+ID4gPiA+IHNwZWNpZmljYWxseSB0aGF0
IGNhbiBiZSBhZGRlZCBzZXBhcmF0ZWx5IGlmIHJlcXVpcmVkLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IFsxXSBnaXQgbG9nIDBlYzU3Y2ZhNzIxZmJkMzZiNGM0YzBkOWNjYzVkNzhhNzhmN2ZhMzUuLkhF
QUQgZHJpdmVycy92aXJ0aW8vCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgY2Fu
IGJlIHJlcHJvZHVjZWQgd2l0aCBhIHNpbXBsZSBtb3VudCwgcnVuIHFlbXUgd2l0aCBzb21lIC12
aXJ0ZnMKPiA+ID4gPiA+IGFyZ3VtZW50IGFuZCBgbW91bnQgLXQgOXAgLW8gZGVidWc9NjU1MzUg
dGFnIG1vdW50cG9pbnRgIHdpbGwgaGFuZyBhZnRlcgo+ID4gPiA+ID4gdGhlc2UgbWVzc2FnZXM6
Cj4gPiA+ID4gPiA5cG5ldDogLS0gcDlfdmlydGlvX3JlcXVlc3QgKDgzKTogOXAgZGVidWc6IHZp
cnRpbyByZXF1ZXN0Cj4gPiA+ID4gPiA5cG5ldDogLS0gcDlfdmlydGlvX3JlcXVlc3QgKDgzKTog
dmlydGlvIHJlcXVlc3Qga2lja2VkCj4gPiA+ID4gPgo+ID4gPiA+ID4gU28gSSBzdXNwZWN0IHdl
J3JlIGp1c3Qgbm90IGdldHRpbmcgYSBjYWxsYmFjay4KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsg
c28uIFRoZSBwYXRjaCBhc3N1bWVzIHRoZSBkcml2ZXIgd2lsbCBjYWxsCj4gPiA+ID4gdmlydHF1
ZXVlX2Rpc2FibGUvZW5hYmxlX2NiKCkgd2hpY2ggaXMgbm90IHRoZSBjYXNlIG9mIHRoZSA5cCBk
cml2ZXIuCj4gPiA+ID4KPiA+ID4gPiBTbyBhZnRlciB0aGUgZmlyc3QgaW50ZXJydXB0LCBldmVu
dF90cmlnZ2VyZWQgd2lsbCBiZSBzZXQgdG8gdHJ1ZSBmb3JldmVyLgo+ID4gPiA+Cj4gPiA+ID4g
VGhhbmtzCj4gPiA+ID4KPiA+ID4KPiA+ID4gSGk6IFdhbmcKPiA+ID4KPiA+ID4gWWVzLCAgVGhp
cyBwYXRjaCBhc3N1bWVzIHRoYXQgYWxsIHZpcnRpby1yZWxhdGVkIGRyaXZlcnMgd2lsbCBjYWxs
Cj4gPiA+IHZpcnRxdWV1ZV9kaXNhYmxlL2VuYWJsZV9jYigpLgo+ID4gPiBUaGFuayB5b3UgZm9y
IHJhaXNpbmcgdGhpcyBpc3N1ZS4KPiA+ID4KPiA+ID4gSXQgc2VlbXMgdGhhdCBuYXBpX3R4IGlz
IG9ubHkgcmVsYXRlZCB0byB2aXJ0dWVfbmV0LiBJJ20gdGhpbmtpbmcgaWYKPiA+ID4gd2UgbmVl
ZCB0byByZWZhY3Rvcgo+ID4gPiBuYXBpX3R4IGluc3RlYWQgb2YgaW1wbGVtZW50aW5nIGl0IGlu
c2lkZSB2aXJ0aW9fcmluZy4KPiA+Cj4gPiBXZSBjYW4gaGVhciBmcm9tIG90aGVycy4KPiA+Cj4g
PiBJIHRoaW5rIGl0J3MgYmV0dGVyIG5vdCB0byB3b3JrYXJvdW5kIHZpcnRpb19yaW5nIGlzc3Vl
cyBpbiBhIHNwZWNpZmljCj4gPiBkcml2ZXIuIEl0IG1pZ2h0IGp1c3QgYWRkIG1vcmUgaGFja3Mu
IFdlIHNob3VsZCBjb3JyZWN0bHkgc2V0Cj4gPiBWUklOR19BVkFJTF9GX05PX0lOVEVSUlVQVCwK
PiA+Cj4gPiBEbyB5b3UgdGhpbmsgdGhlIGZvbGxvd2luZyBtaWdodCB3b3JrIChub3QgZXZlbiBh
IGNvbXBpbGUgdGVzdCk/Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b19yaW5nLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiBpbmRleCA0MTE0NGI1
MjQ2YTguLjEyZjRlZmI2ZGM1NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRp
b19yaW5nLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+IEBAIC04
NTIsMTYgKzg1MiwxNiBAQCBzdGF0aWMgdm9pZCB2aXJ0cXVldWVfZGlzYWJsZV9jYl9zcGxpdChz
dHJ1Y3QKPiA+IHZpcnRxdWV1ZSAqX3ZxKQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IHZyaW5n
X3ZpcnRxdWV1ZSAqdnEgPSB0b192dnEoX3ZxKTsKPiA+Cj4gPiAtICAgICAgIGlmICghKHZxLT5z
cGxpdC5hdmFpbF9mbGFnc19zaGFkb3cgJiBWUklOR19BVkFJTF9GX05PX0lOVEVSUlVQVCkpIHsK
PiA+IC0gICAgICAgICAgICAgICB2cS0+c3BsaXQuYXZhaWxfZmxhZ3Nfc2hhZG93IHw9IFZSSU5H
X0FWQUlMX0ZfTk9fSU5URVJSVVBUOwo+ID4gLSAgICAgICAgICAgICAgIGlmICh2cS0+ZXZlbnQp
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAvKiBUT0RPOiB0aGlzIGlzIGEgaGFjay4gRmln
dXJlIG91dCBhIGNsZWFuZXIKPiA+IHZhbHVlIHRvIHdyaXRlLiAqLwo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgdnJpbmdfdXNlZF9ldmVudCgmdnEtPnNwbGl0LnZyaW5nKSA9IDB4MDsKPiA+
IC0gICAgICAgICAgICAgICBlbHNlCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICB2cS0+c3Bs
aXQudnJpbmcuYXZhaWwtPmZsYWdzID0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY3B1X3RvX3ZpcnRpbzE2KF92cS0+dmRldiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZxLT5zcGxpdC5hdmFpbF9mbGFnc19zaGFkb3cpOwo+
ID4gLSAgICAgICB9Cj4gPiArICAgICAgIGlmICghKHZxLT5zcGxpdC5hdmFpbF9mbGFnc19zaGFk
b3cgJiBWUklOR19BVkFJTF9GX05PX0lOVEVSUlVQVCkpCj4gPiArICAgICAgICAgICAgICAgdnEt
PnNwbGl0LmF2YWlsX2ZsYWdzX3NoYWRvdyB8PSBWUklOR19BVkFJTF9GX05PX0lOVEVSUlVQVDsK
PiA+ICsKPiA+ICsgICAgICAgaWYgKHZxLT5ldmVudCAmJiAhdnEtPmV2ZW50X3RyaWdnZXJlZCkK
PiA+ICsgICAgICAgICAgICAgICAvKiBUT0RPOiB0aGlzIGlzIGEgaGFjay4gRmlndXJlIG91dCBh
IGNsZWFuZXIgdmFsdWUgdG8gd3JpdGUuICovCj4gPiArICAgICAgICAgICAgICAgdnJpbmdfdXNl
ZF9ldmVudCgmdnEtPnNwbGl0LnZyaW5nKSA9IDB4MDsKPiA+ICsgICAgICAgZWxzZQo+ID4gKyAg
ICAgICAgICAgICAgIHZxLT5zcGxpdC52cmluZy5hdmFpbC0+ZmxhZ3MgPQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY3B1X3RvX3ZpcnRpbzE2KF92cS0+dmRldiwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2cS0+c3BsaXQuYXZhaWxfZmxhZ3Nfc2hhZG93
KTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgdmlydHF1ZXVlX2VuYWJsZV9j
Yl9wcmVwYXJlX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSkKPiA+IEBAIC0xNjk3LDggKzE2
OTcsMTAgQEAgc3RhdGljIHZvaWQgdmlydHF1ZXVlX2Rpc2FibGVfY2JfcGFja2VkKHN0cnVjdAo+
ID4gdmlydHF1ZXVlICpfdnEpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgdnJpbmdfdmlydHF1
ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+ID4KPiA+IC0gICAgICAgaWYgKHZxLT5wYWNrZWQuZXZl
bnRfZmxhZ3Nfc2hhZG93ICE9IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RJU0FCTEUpIHsKPiA+
ICsgICAgICAgaWYgKCEodnEtPnBhY2tlZC5ldmVudF9mbGFnc19zaGFkb3cgJiBWUklOR19QQUNL
RURfRVZFTlRfRkxBR19ESVNBQkxFKSkKPiA+ICAgICAgICAgICAgICAgICB2cS0+cGFja2VkLmV2
ZW50X2ZsYWdzX3NoYWRvdyA9IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RJU0FCTEU7Cj4gPiAr
Cj4gPiArICAgICAgIGlmICh2cS0+ZXZlbnRfdHJpZ2dlcmVkKQo+ID4gICAgICAgICAgICAgICAg
IHZxLT5wYWNrZWQudnJpbmcuZHJpdmVyLT5mbGFncyA9Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBjcHVfdG9fbGUxNih2cS0+cGFja2VkLmV2ZW50X2ZsYWdzX3NoYWRvdyk7Cj4gPiAgICAg
ICAgIH0KPiA+IEBAIC0yMzMwLDEyICsyMzMyLDYgQEAgdm9pZCB2aXJ0cXVldWVfZGlzYWJsZV9j
YihzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgdnJpbmdf
dmlydHF1ZXVlICp2cSA9IHRvX3Z2cShfdnEpOwo+ID4KPiA+IC0gICAgICAgLyogSWYgZGV2aWNl
IHRyaWdnZXJlZCBhbiBldmVudCBhbHJlYWR5IGl0IHdvbid0IHRyaWdnZXIgb25lIGFnYWluOgo+
ID4gLSAgICAgICAgKiBubyBuZWVkIHRvIGRpc2FibGUuCj4gPiAtICAgICAgICAqLwo+ID4gLSAg
ICAgICBpZiAodnEtPmV2ZW50X3RyaWdnZXJlZCkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm47
Cj4gPiAtCj4gPiAgICAgICAgIGlmICh2cS0+cGFja2VkX3JpbmcpCj4gPiAgICAgICAgICAgICAg
ICAgdmlydHF1ZXVlX2Rpc2FibGVfY2JfcGFja2VkKF92cSk7Cj4gPiAgICAgICAgIGVsc2UKPiA+
Cj4gPiBUaGFua3MKPiA+Cj4gCj4gSGksIFRoaXMgcGF0Y2ggc2VlbXMgdG8gYWRkcmVzcyB0aGUg
aXNzdWUgSSBpbml0aWFsbHkgcmFpc2VkIGFuZCBhbHNvCj4gYXZvaWRzIHRoZSBwcm9ibGVtIHdp
dGggdmlydGlvLTlQLgo+IAo+IGJ1dCBtYXliZSB0aGlzIGlzIGEgYmV0dGVyIGNob2ljZToKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyBiL2RyaXZlcnMvdmly
dGlvL3ZpcnRpb19yaW5nLmMKPiBpbmRleCAzMDdlMTM5Y2IxMWQuLjY3ODRkMTU1Yzc4MSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gKysrIGIvZHJpdmVycy92
aXJ0aW8vdmlydGlvX3JpbmcuYwo+IEBAIC04MTIsNiArODEyLDEwIEBAIHN0YXRpYyB2b2lkIHZp
cnRxdWV1ZV9kaXNhYmxlX2NiX3NwbGl0KHN0cnVjdAo+IHZpcnRxdWV1ZSAqX3ZxKQo+IAo+ICAg
ICAgICAgaWYgKCEodnEtPnNwbGl0LmF2YWlsX2ZsYWdzX3NoYWRvdyAmIFZSSU5HX0FWQUlMX0Zf
Tk9fSU5URVJSVVBUKSkgewo+ICAgICAgICAgICAgICAgICB2cS0+c3BsaXQuYXZhaWxfZmxhZ3Nf
c2hhZG93IHw9IFZSSU5HX0FWQUlMX0ZfTk9fSU5URVJSVVBUOwo+ICsKPiArICAgICAgICAgICAg
ICAgaWYgKHZxLT5ldmVudF90cmlnZ2VyZWQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+ICsKPiAgICAgICAgICAgICAgICAgaWYgKHZxLT5ldmVudCkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAvKiBUT0RPOiB0aGlzIGlzIGEgaGFjay4gRmlndXJlIG91dCBhIGNsZWFuZXIK
PiB2YWx1ZSB0byB3cml0ZS4gKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICB2cmluZ191c2Vk
X2V2ZW50KCZ2cS0+c3BsaXQudnJpbmcpID0gMHgwOwo+IEBAIC0xNTQ2LDYgKzE1NTAsMTAgQEAg
c3RhdGljIHZvaWQgdmlydHF1ZXVlX2Rpc2FibGVfY2JfcGFja2VkKHN0cnVjdAo+IHZpcnRxdWV1
ZSAqX3ZxKQo+IAo+ICAgICAgICAgaWYgKHZxLT5wYWNrZWQuZXZlbnRfZmxhZ3Nfc2hhZG93ICE9
IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RJU0FCTEUpIHsKPiAgICAgICAgICAgICAgICAgdnEt
PnBhY2tlZC5ldmVudF9mbGFnc19zaGFkb3cgPSBWUklOR19QQUNLRURfRVZFTlRfRkxBR19ESVNB
QkxFOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKHZxLT5ldmVudF90cmlnZ2VyZWQpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAgICAgICAgICAgICAgdnEtPnBh
Y2tlZC52cmluZy5kcml2ZXItPmZsYWdzID0KPiAgICAgICAgICAgICAgICAgICAgICAgICBjcHVf
dG9fbGUxNih2cS0+cGFja2VkLmV2ZW50X2ZsYWdzX3NoYWRvdyk7Cj4gICAgICAgICB9Cj4gQEAg
LTIwNjMsMTIgKzIwNzEsNiBAQCB2b2lkIHZpcnRxdWV1ZV9kaXNhYmxlX2NiKHN0cnVjdCB2aXJ0
cXVldWUgKl92cSkKPiAgewo+ICAgICAgICAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEgPSB0
b192dnEoX3ZxKTsKPiAKPiAtICAgICAgIC8qIElmIGRldmljZSB0cmlnZ2VyZWQgYW4gZXZlbnQg
YWxyZWFkeSBpdCB3b24ndCB0cmlnZ2VyIG9uZSBhZ2FpbjoKPiAtICAgICAgICAqIG5vIG5lZWQg
dG8gZGlzYWJsZS4KPiAtICAgICAgICAqLwo+IC0gICAgICAgaWYgKHZxLT5ldmVudF90cmlnZ2Vy
ZWQpCj4gLSAgICAgICAgICAgICAgIHJldHVybjsKPiAtCj4gICAgICAgICBpZiAodnEtPnBhY2tl
ZF9yaW5nKQo+ICAgICAgICAgICAgICAgICB2aXJ0cXVldWVfZGlzYWJsZV9jYl9wYWNrZWQoX3Zx
KTsKPiAgICAgICAgIGVsc2UKPiAKPiBEb2VzIE1pY2hhZWwgaGF2ZSBhbnkgb3RoZXIgc3VnZ2Vz
dGlvbnM/Cj4gCj4gVGhhbmtzLgoKT2ggSSBmaW5hbGx5IHVuZGVyc3RhbmQgSSB0aGluay4gVGhl
IGlzc3VlIGlzIHdpdGggZXZlbnQgaW5kZXgKZW5hYmxlZC4gaW50ZXJydXB0IGZpcmVzIG9uY2Us
IHdlIHNldCBldmVudCBpbmRleCB0byAweDAuCnNpbmNlIHNoYWRvdyBpcyBub3Qgc2V0IHRoZW4g
d2UgbmV2ZXIgdXBkYXRlIGl0IGFnYWluLgoKSSBhZ3JlZSwgeW91ciBwYXRjaCBpcyBhIGdvb2Qg
Zml4LCBqdXN0IHBsZWFzZSBjb3B5IHRoZSBjb21tZW50CnlvdSBhcmUgcmVtb3ZpbmcgdG8gdGhl
IHR3byBwbGFjZXMgd2hlcmUgd2UgY2hlY2sgZXZlbnRfdHJpZ2dlcmVkIG5vdy4KSSBkcm9wcGVk
IHBhdGNoIHYyIGZyb20gbXkgdHJlZSBhbmQgcGxlYXNlIHBvc3QgdjMKd2l0aCB0aGlzIGZpeHVw
IHNxdWFzaGVkLgoKVGhhbmtzIGEgbG90IQoKCgpBcHJvcG9zIGlmIHdlIGZpeGVkIGFsbCBkcml2
ZXJzIHRvIGNhbGwgZGlzYWJsZS9lbmFibGVfY2IKZXhwbGljaXRseSB3ZSBjb3VsZCByZW1vdmUg
YnJhbmNoIG9uIGRhdGEgcGF0aCwgYnV0IGl0J3MgYSBsb3Qgb2Ygd29yawphbmQgaXQncyBlYXN5
IHRvIG1pc3Mgc29tZSBkcml2ZXJzLgoKCgo+ID4gPgo+ID4gPiBUaGFua3MKPiA+ID4KPiA+ID4g
PiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSdsbCBoYXZlIGEgY2xvc2VyIGxvb2sgYWZ0ZXIgd29y
aywgYnV0IGFueSBhZHZpY2UgbWVhbndoaWxlIHdpbGwgYmUKPiA+ID4gPiA+IGFwcHJlY2lhdGVk
IQo+ID4gPiA+ID4gKEknbSBzdXJlIEx1aXMgd291bGQgYWxzbyBsaWtlIGEgdGVtcG9yYXJ5IGRy
b3AgZnJvbSAtbmV4dCB1bnRpbAo+ID4gPiA+ID4gdGhpcyBpcyBmaWd1cmVkIG91dCwgYnV0IEkn
bGwgbGVhdmUgdGhpcyB1cCB0byB5b3UpCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gSWYgd2UgZGlzYWJsZSB0aGUgbmFwaV90eCwgaXQgd2lsbCBvbmx5IGJlIGNh
bGxlZCB3aGVuIHRoZSB0eCByaW5nCj4gPiA+ID4gPiA+IGJ1ZmZlciBpcyByZWxhdGl2ZWx5IHNt
YWxsLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBCZWNhdXNlIGV2ZW50X3RyaWdnZXJlZCBpcyB0
cnVlLiBUaGVyZWZvcmUsIFZSSU5HX0FWQUlMX0ZfTk9fSU5URVJSVVBUIG9yCj4gPiA+ID4gPiA+
IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RJU0FCTEUgd2lsbCBub3QgYmUgc2V0LiBTbyB3ZSB1
cGRhdGUKPiA+ID4gPiA+ID4gdnJpbmdfdXNlZF9ldmVudCgmdnEtPnNwbGl0LnZyaW5nKSBvciB2
cS0+cGFja2VkLnZyaW5nLmRyaXZlci0+b2ZmX3dyYXAKPiA+ID4gPiA+ID4gZXZlcnkgdGltZSB3
ZSBjYWxsIHZpcnRxdWV1ZV9nZXRfYnVmX2N0eC4gVGhpcyB3aWxsIGJyaW5nIG1vcmUgaW50ZXJy
dXB0aW9ucy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVG8gc3VtbWFyaXplOgo+ID4gPiA+ID4g
PiAxKSBldmVudF90cmlnZ2VyZWQgd2FzIHNldCB0byB0cnVlIGluIHZyaW5nX2ludGVycnVwdCgp
Cj4gPiA+ID4gPiA+IDIpIGFmdGVyIHRoaXMgbm90aGluZyB3aWxsIGhhcHBlbiBmb3IgdmlydHF1
ZXVlX2Rpc2FibGVfY2IoKSBzbwo+ID4gPiA+ID4gPiAgICBWUklOR19BVkFJTF9GX05PX0lOVEVS
UlVQVCBpcyBub3Qgc2V0IGluIGF2YWlsX2ZsYWdzX3NoYWRvdwo+ID4gPiA+ID4gPiAzKSB2aXJ0
cXVldWVfZ2V0X2J1Zl9jdHhfc3BsaXQoKSB3aWxsIHN0aWxsIHRoaW5rIHRoZSBjYiBpcyBlbmFi
bGVkCj4gPiA+ID4gPiA+ICAgIHRoZW4gaXQgdHJpZXMgdG8gcHVibGlzaCBuZXcgZXZlbnQKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gVG8gZml4LCBpZiBldmVudF90cmlnZ2VyZWQgaXMgc2V0IHRv
IHRydWUsIGRvIG5vdCB1cGRhdGUKPiA+ID4gPiA+ID4gdnJpbmdfdXNlZF9ldmVudCgmdnEtPnNw
bGl0LnZyaW5nKSBvciB2cS0+cGFja2VkLnZyaW5nLmRyaXZlci0+b2ZmX3dyYXAKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gVGVzdGVkIHdpdGggaXBlcmY6Cj4gPiA+ID4gPiA+IGlwZXJmMyB0Y3Ag
c3RyZWFtOgo+ID4gPiA+ID4gPiB2bTEgLS0tLS0tLS0tLS0tLS0tLS0+IHZtMgo+ID4gPiA+ID4g
PiB2bTIganVzdCByZWNlaXZlcyB0Y3AgZGF0YSBzdHJlYW0gZnJvbSB2bTEsIGFuZCBzZW5kcyB0
aGUgYWNrIHRvIHZtMSwKPiA+ID4gPiA+ID4gdGhlcmUgYXJlIG1hbnkgdHggaW50ZXJydXB0cyBp
biB2bTIuCj4gPiA+ID4gPiA+IGJ1dCB3aXRob3V0IGV2ZW50X3RyaWdnZXJlZCB0aGVyZSBhcmUg
anVzdCBhIGZldyB0eCBpbnRlcnJ1cHRzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBGaXhlczog
OGQ2MjJkMjFkMjQ4ICgidmlydGlvOiBmaXggdXAgdmlydGlvX2Rpc2FibGVfY2IiKQo+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGJlcnQgSHVhbmcgPGh1YW5namllLmFsYmVydEBieXRlZGFu
Y2UuY29tPgo+ID4gPiA+ID4gPiBNZXNzYWdlLUlkOiA8MjAyMzAzMjEwODU5NTMuMjQ5NDktMS1o
dWFuZ2ppZS5hbGJlcnRAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
TWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+
ID4gPiA+ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgNiArKysrLS0KPiA+ID4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmlu
Zy5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4gPiA+ID4gPiBpbmRleCBjYmVl
ZWExYjA0MzkuLjFjMzZmYTQ3Nzk2NiAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92
aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcmluZy5jCj4gPiA+ID4gPiA+IEBAIC05MTQsNyArOTE0LDggQEAgc3RhdGljIHZvaWQgKnZp
cnRxdWV1ZV9nZXRfYnVmX2N0eF9zcGxpdChzdHJ1Y3QgdmlydHF1ZXVlICpfdnEsCj4gPiA+ID4g
PiA+ICAgICAgIC8qIElmIHdlIGV4cGVjdCBhbiBpbnRlcnJ1cHQgZm9yIHRoZSBuZXh0IGVudHJ5
LCB0ZWxsIGhvc3QKPiA+ID4gPiA+ID4gICAgICAgICogYnkgd3JpdGluZyBldmVudCBpbmRleCBh
bmQgZmx1c2ggb3V0IHRoZSB3cml0ZSBiZWZvcmUKPiA+ID4gPiA+ID4gICAgICAgICogdGhlIHJl
YWQgaW4gdGhlIG5leHQgZ2V0X2J1ZiBjYWxsLiAqLwo+ID4gPiA+ID4gPiAtICAgICBpZiAoISh2
cS0+c3BsaXQuYXZhaWxfZmxhZ3Nfc2hhZG93ICYgVlJJTkdfQVZBSUxfRl9OT19JTlRFUlJVUFQp
KQo+ID4gPiA+ID4gPiArICAgICBpZiAodW5saWtlbHkoISh2cS0+c3BsaXQuYXZhaWxfZmxhZ3Nf
c2hhZG93ICYgVlJJTkdfQVZBSUxfRl9OT19JTlRFUlJVUFQpICYmCj4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAhdnEtPmV2ZW50X3RyaWdnZXJlZCkpCj4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgdmlydGlvX3N0b3JlX21iKHZxLT53ZWFrX2JhcnJpZXJzLAo+ID4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmdnJpbmdfdXNlZF9ldmVudCgmdnEtPnNwbGl0LnZy
aW5nKSwKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3RvX3Zp
cnRpbzE2KF92cS0+dmRldiwgdnEtPmxhc3RfdXNlZF9pZHgpKTsKPiA+ID4gPiA+ID4gQEAgLTE3
NDQsNyArMTc0NSw4IEBAIHN0YXRpYyB2b2lkICp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHhfcGFja2Vk
KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+ID4gPiA+ID4gICAgICAgICogYnkgd3JpdGluZyBl
dmVudCBpbmRleCBhbmQgZmx1c2ggb3V0IHRoZSB3cml0ZSBiZWZvcmUKPiA+ID4gPiA+ID4gICAg
ICAgICogdGhlIHJlYWQgaW4gdGhlIG5leHQgZ2V0X2J1ZiBjYWxsLgo+ID4gPiA+ID4gPiAgICAg
ICAgKi8KPiA+ID4gPiA+ID4gLSAgICAgaWYgKHZxLT5wYWNrZWQuZXZlbnRfZmxhZ3Nfc2hhZG93
ID09IFZSSU5HX1BBQ0tFRF9FVkVOVF9GTEFHX0RFU0MpCj4gPiA+ID4gPiA+ICsgICAgIGlmICh1
bmxpa2VseSh2cS0+cGFja2VkLmV2ZW50X2ZsYWdzX3NoYWRvdyA9PSBWUklOR19QQUNLRURfRVZF
TlRfRkxBR19ERVNDICYmCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAhdnEtPmV2ZW50
X3RyaWdnZXJlZCkpCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgdmlydGlvX3N0b3JlX21iKHZx
LT53ZWFrX2JhcnJpZXJzLAo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmdnEtPnBhY2tlZC52cmluZy5kcml2ZXItPm9mZl93cmFwLAo+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjcHVfdG9fbGUxNih2cS0+bGFzdF91c2VkX2lkeCkpOwo+
ID4gPiA+ID4KPiA+ID4gPgo+ID4gPgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
