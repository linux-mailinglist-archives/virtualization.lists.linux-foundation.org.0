Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D094D1159
	for <lists.virtualization@lfdr.de>; Tue,  8 Mar 2022 08:55:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF007408E2;
	Tue,  8 Mar 2022 07:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpCDXzZlkget; Tue,  8 Mar 2022 07:55:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9B5AE404D0;
	Tue,  8 Mar 2022 07:55:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 360CFC0073;
	Tue,  8 Mar 2022 07:55:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 772B2C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 07:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FBB7408E9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 07:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpzPA6QrWY6n
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 07:55:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A49F404D0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646726133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFezi77WesJBzFK1fhaAbsIyGgE1choY2kdQrE0mkS4=;
 b=d0NoughBUnNxcq3vKmH1ARJz09Gs9Fw/AZ62U4VudeHCT4Lt2VCzOq9lDpLZcW+KVVQw5P
 7BEov1o5OoZUKmkZH7Dqaz6rSmdAOzmb3XT4YGJ1HhI/1NRVxU3haP2opviaumkQy0PSyv
 gUKT3yeyGu42kdu+62/oWBBaB7hZLiI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-GSFRqrGoO2u2ZAOUKa2l0w-1; Tue, 08 Mar 2022 02:55:31 -0500
X-MC-Unique: GSFRqrGoO2u2ZAOUKa2l0w-1
Received: by mail-ed1-f69.google.com with SMTP id
 n11-20020aa7c68b000000b0041641550e11so3746945edq.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 07 Mar 2022 23:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UFezi77WesJBzFK1fhaAbsIyGgE1choY2kdQrE0mkS4=;
 b=xtNnugkKzgD6Drt+HQImflA6aT9r2AQX/ggJadiwFNKJA2eGchhh8BHlEOhGAWFiFH
 fifOh0XGTePR16V7Zdw7NSPGXFg67m+4NUFQ0DB1H57eoaJu/SYmfKY9FEO59ttGTedc
 hM+yHF5cAYfNzC9/hakfSikHI8TUPIqnMzZIcMCsSWYuDyVs+byf4f5g1kTBt1bF8xzw
 C4YB/pNqvCl9kyFr039j6P+PYC3dl9FnPVjUycoR6/qdh809x8lxmqeAoH7Xl+qslW3E
 bsLPmAoTYm0kN/2/sfz68d9fHw71SLw5190+Xua33AsFKhJr57o58VB2ZwhfsuvCVdMG
 Y7fg==
X-Gm-Message-State: AOAM532aEHbeakbt6FomhuhEL2gOVgWHVOCjIatKRC91g2uJenAqtI3J
 Jss5F3l6DbaSbrwY2yUv0eWFchXNDnSSPv+J5m5bwTFCz/1D3xjgcMyLvb/EwxmcX3fcsldIxqh
 O+tQ5695FWawk1FOePluBrfLtgj2zVpc6g+vKxYEuVw==
X-Received: by 2002:a17:907:160d:b0:6db:49bb:2c7a with SMTP id
 hb13-20020a170907160d00b006db49bb2c7amr1760428ejc.228.1646726129729; 
 Mon, 07 Mar 2022 23:55:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPLIh9zjOVAW9d23M/7A7pRnUKI7iQh9+Zh18H1bTRewg2yW6RP5RnWMHUmqjcD9h29Kldxw==
X-Received: by 2002:a17:907:160d:b0:6db:49bb:2c7a with SMTP id
 hb13-20020a170907160d00b006db49bb2c7amr1760400ejc.228.1646726129410; 
 Mon, 07 Mar 2022 23:55:29 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170906762100b006d00ae72b0csm5465608ejn.221.2022.03.07.23.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:55:28 -0800 (PST)
Date: Tue, 8 Mar 2022 02:55:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
Message-ID: <20220308024724-mutt-send-email-mst@kernel.org>
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
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

T24gVHVlLCBNYXIgMDgsIDIwMjIgYXQgMDM6MzQ6MTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiBUdWUsIE1hciA4LCAyMDIyIGF0IDM6MjggUE0gTWljaGFlbCBTLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXIgMDgsIDIwMjIgYXQgMDM6
MTQ6MzVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXIgOCwgMjAy
MiBhdCAzOjExIFBNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gT24gVHVlLCBNYXIgMDgsIDIwMjIgYXQgMDI6MDM6MzJQTSArMDgwMCwg
SmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiDlnKggMjAyMi8zLzcg5LiL5Y2I
MTE6MzMsIEV1Z2VuaW8gUMOpcmV6IOWGmemBkzoKPiA+ID4gPiA+ID4gVGhpcyBzZXJpZXMgZW5h
YmxlIHNoYWRvdyB2aXJ0cXVldWUgKFNWUSkgZm9yIHZob3N0LXZkcGEgZGV2aWNlcy4gVGhpcwo+
ID4gPiA+ID4gPiBpcyBpbnRlbmRlZCBhcyBhIG5ldyBtZXRob2Qgb2YgdHJhY2tpbmcgdGhlIG1l
bW9yeSB0aGUgZGV2aWNlcyB0b3VjaAo+ID4gPiA+ID4gPiBkdXJpbmcgYSBtaWdyYXRpb24gcHJv
Y2VzczogSW5zdGVhZCBvZiByZWxheSBvbiB2aG9zdCBkZXZpY2UncyBkaXJ0eQo+ID4gPiA+ID4g
PiBsb2dnaW5nIGNhcGFiaWxpdHksIFNWUSBpbnRlcmNlcHRzIHRoZSBWUSBkYXRhcGxhbmUgZm9y
d2FyZGluZyB0aGUKPiA+ID4gPiA+ID4gZGVzY3JpcHRvcnMgYmV0d2VlbiBWTSBhbmQgZGV2aWNl
LiBUaGlzIHdheSBxZW11IGlzIHRoZSBlZmZlY3RpdmUKPiA+ID4gPiA+ID4gd3JpdGVyIG9mIGd1
ZXN0cyBtZW1vcnksIGxpa2UgaW4gcWVtdSdzIHZpcnRpbyBkZXZpY2Ugb3BlcmF0aW9uLgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBXaGVuIFNWUSBpcyBlbmFibGVkIHFlbXUgb2ZmZXJzIGEgbmV3
IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSB0byB0aGUKPiA+ID4gPiA+ID4gZGV2aWNlIHRvIHJlYWQg
YW5kIHdyaXRlIGludG8sIGFuZCBpdCBtYXBzIG5ldyB2cmluZ3MgYW5kIHRoZSBndWVzdAo+ID4g
PiA+ID4gPiBtZW1vcnkgaW4gaXQuIFNWUSBhbHNvIGludGVyY2VwdHMga2lja3MgYW5kIGNhbGxz
IGJldHdlZW4gdGhlIGRldmljZQo+ID4gPiA+ID4gPiBhbmQgdGhlIGd1ZXN0LiBVc2VkIGJ1ZmZl
cnMgcmVsYXkgd291bGQgY2F1c2UgZGlydHkgbWVtb3J5IGJlaW5nCj4gPiA+ID4gPiA+IHRyYWNr
ZWQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgZWZmZWN0aXZlbHkgbWVhbnMgdGhhdCB2
RFBBIGRldmljZSBwYXNzdGhyb3VnaCBpcyBpbnRlcmNlcHRlZCBieQo+ID4gPiA+ID4gPiBxZW11
LiBXaGlsZSBTVlEgc2hvdWxkIG9ubHkgYmUgZW5hYmxlZCBhdCBtaWdyYXRpb24gdGltZSwgdGhl
IHN3aXRjaGluZwo+ID4gPiA+ID4gPiBmcm9tIHJlZ3VsYXIgbW9kZSB0byBTVlEgbW9kZSBpcyBs
ZWZ0IGZvciBhIGZ1dHVyZSBzZXJpZXMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEl0IGlzIGJh
c2VkIG9uIHRoZSBpZGVhcyBvZiBEUERLIFNXIGFzc2lzdGVkIExNLCBpbiB0aGUgc2VyaWVzIG9m
Cj4gPiA+ID4gPiA+IERQREsncyBodHRwczovL3BhdGNod29yay5kcGRrLm9yZy9jb3Zlci80ODM3
MC8gLiBIb3dldmVyLCB0aGVzZSBkb2VzCj4gPiA+ID4gPiA+IG5vdCBtYXAgdGhlIHNoYWRvdyB2
cSBpbiBndWVzdCdzIFZBLCBidXQgaW4gcWVtdSdzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBG
b3IgcWVtdSB0byB1c2Ugc2hhZG93IHZpcnRxdWV1ZXMgdGhlIGd1ZXN0IHZpcnRpbyBkcml2ZXIg
bXVzdCBub3QgdXNlCj4gPiA+ID4gPiA+IGZlYXR1cmVzIGxpa2UgZXZlbnRfaWR4Lgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBTVlEgbmVlZHMgdG8gYmUgZW5hYmxlZCB3aXRoIGNtZGxpbmU6Cj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IC1uZXRkZXYgdHlwZT12aG9zdC12ZHBhLHZob3N0ZGV2PXZo
b3N0LXZkcGEtMCxpZD12aG9zdC12ZHBhMCxzdnE9b24KPiA+ID4gPgo+ID4gPiA+IEEgc3RhYmxl
IEFQSSBmb3IgYW4gaW5jb21wbGV0ZSBmZWF0dXJlIGlzIGEgcHJvYmxlbSBpbWhvLgo+ID4gPgo+
ID4gPiBJdCBzaG91bGQgYmUgIngtc3ZxIi4KPiA+Cj4gPgo+ID4gV2VsbCBsb29rIGF0IHBhdGNo
IDE1Lgo+IAo+IEl0J3MgYSBidWcgdGhhdCBuZWVkcyB0byBiZSBmaXhlZC4KPiAKPiA+Cj4gPiA+
ID4KPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgZmlyc3QgdGhyZWUgcGF0Y2hl
cyBlbmFibGVzIG5vdGlmaWNhdGlvbnMgZm9yd2FyZGluZyB3aXRoCj4gPiA+ID4gPiA+IGFzc2lz
dGFuY2Ugb2YgcWVtdS4gSXQncyBlYXN5IHRvIGVuYWJsZSBvbmx5IHRoaXMgaWYgdGhlIHJlbGV2
YW50Cj4gPiA+ID4gPiA+IGNtZGxpbmUgcGFydCBvZiB0aGUgbGFzdCBwYXRjaCBpcyBhcHBsaWVk
IG9uIHRvcCBvZiB0aGVzZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gTmV4dCBmb3VyIHBhdGNo
ZXMgaW1wbGVtZW50IHRoZSBhY3R1YWwgYnVmZmVyIGZvcndhcmRpbmcuIEhvd2V2ZXIsCj4gPiA+
ID4gPiA+IGFkZHJlc3MgYXJlIG5vdCB0cmFuc2xhdGVkIGZyb20gSFZBIHNvIHRoZXkgd2lsbCBu
ZWVkIGEgaG9zdCBkZXZpY2Ugd2l0aAo+ID4gPiA+ID4gPiBhbiBpb21tdSBhbGxvd2luZyB0aGVt
IHRvIGFjY2VzcyBhbGwgb2YgdGhlIEhWQSByYW5nZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
VGhlIGxhc3QgcGFydCBvZiB0aGUgc2VyaWVzIHVzZXMgcHJvcGVybHkgdGhlIGhvc3QgaW9tbXUs
IHNvIHFlbXUKPiA+ID4gPiA+ID4gY3JlYXRlcyBhIG5ldyBpb3ZhIGFkZHJlc3Mgc3BhY2UgaW4g
dGhlIGRldmljZSdzIHJhbmdlIGFuZCB0cmFuc2xhdGVzCj4gPiA+ID4gPiA+IHRoZSBidWZmZXJz
IGluIGl0LiBGaW5hbGx5LCBpdCBhZGRzIHRoZSBjbWRsaW5lIHBhcmFtZXRlci4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gU29tZSBzaW1wbGUgcGVyZm9ybWFuY2UgdGVzdHMgd2l0aCBuZXRwZXJm
IHdlcmUgZG9uZS4gVGhleSB1c2VkIGEgbmVzdGVkCj4gPiA+ID4gPiA+IGd1ZXN0IHdpdGggdnBf
dmRwYSwgdmhvc3Qta2VybmVsIGF0IEwwIGhvc3QuIFN0YXJ0aW5nIHdpdGggbm8gc3ZxIGFuZCBh
Cj4gPiA+ID4gPiA+IGJhc2VsaW5lIGF2ZXJhZ2Ugb2YgfjkwMDkuOTZNYnBzOgo+ID4gPiA+ID4g
PiBSZWN2ICAgU2VuZCAgICBTZW5kCj4gPiA+ID4gPiA+IFNvY2tldCBTb2NrZXQgIE1lc3NhZ2Ug
IEVsYXBzZWQKPiA+ID4gPiA+ID4gU2l6ZSAgIFNpemUgICAgU2l6ZSAgICAgVGltZSAgICAgVGhy
b3VnaHB1dAo+ID4gPiA+ID4gPiBieXRlcyAgYnl0ZXMgICBieXRlcyAgICBzZWNzLiAgICAxMF42
Yml0cy9zZWMKPiA+ID4gPiA+ID4gMTMxMDcyICAxNjM4NCAgMTYzODQgICAgMzAuMDEgICAgOTA2
MS4wMwo+ID4gPiA+ID4gPiAxMzEwNzIgIDE2Mzg0ICAxNjM4NCAgICAzMC4wMSAgICA4OTYyLjk0
Cj4gPiA+ID4gPiA+IDEzMTA3MiAgMTYzODQgIDE2Mzg0ICAgIDMwLjAxICAgIDkwMDUuOTIKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gVG8gZW5hYmxlIFNWUSBidWZmZXJzIGZvcndhcmRpbmcgcmVk
dWNlIHRocm91Z2hwdXQgdG8gYWJvdXQKPiA+ID4gPiA+ID4gUmVjdiAgIFNlbmQgICAgU2VuZAo+
ID4gPiA+ID4gPiBTb2NrZXQgU29ja2V0ICBNZXNzYWdlICBFbGFwc2VkCj4gPiA+ID4gPiA+IFNp
emUgICBTaXplICAgIFNpemUgICAgIFRpbWUgICAgIFRocm91Z2hwdXQKPiA+ID4gPiA+ID4gYnl0
ZXMgIGJ5dGVzICAgYnl0ZXMgICAgc2Vjcy4gICAgMTBeNmJpdHMvc2VjCj4gPiA+ID4gPiA+IDEz
MTA3MiAgMTYzODQgIDE2Mzg0ICAgIDMwLjAxICAgIDc2ODkuNzIKPiA+ID4gPiA+ID4gMTMxMDcy
ICAxNjM4NCAgMTYzODQgICAgMzAuMDAgICAgNzc1Mi4wNwo+ID4gPiA+ID4gPiAxMzEwNzIgIDE2
Mzg0ICAxNjM4NCAgICAzMC4wMSAgICA3NzUwLjMwCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhv
d2V2ZXIsIG1hbnkgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzIHdlcmUgbGVmdCBvdXQgb2YgdGhp
cyBzZXJpZXMgZm9yCj4gPiA+ID4gPiA+IHNpbXBsaWNpdHksIHNvIGRpZmZlcmVuY2Ugc2hvdWxk
IHNocmluayBpbiB0aGUgZnV0dXJlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBDb21tZW50cyBh
cmUgd2VsY29tZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkgTWljaGFlbDoKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBXaGF0IGRvIHlvdSB0aGluayBvZiB0aGlzIHNlcmllcz8gSXQgbG9v
a3MgZ29vZCB0byBtZSBhcyBhIHN0YXJ0LiBUaGUKPiA+ID4gPiA+IGZlYXR1cmUgY291bGQgb25s
eSBiZSBlbmFibGVkIGFzIGEgZGVkaWNhdGVkIHBhcmFtZXRlci4gSWYgeW91J3JlIG9rLCBJJ2QK
PiA+ID4gPiA+IHRyeSB0byBtYWtlIGl0IGZvciA3LjAuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhh
bmtzCj4gPiA+ID4KPiA+ID4gPiBXZWxsIHRoYXQncyBjdXR0aW5nIGl0IGF3ZnVsbHkgY2xvc2Us
IGFuZCBpdCdzIG5vdCByZWFsbHkgdXNlZnVsCj4gPiA+ID4gYXQgdGhlIGN1cnJlbnQgc3RhZ2Us
IGlzIGl0Pwo+ID4gPgo+ID4gPiBUaGlzIGFsbG93cyB2RFBBIHRvIGJlIG1pZ3JhdGVkIHdoZW4g
dXNpbmcgIngtc3ZxPW9uIi4KPiA+ID4gQnV0IGFueWhvdyBpdCdzCj4gPiA+IGV4cGVyaW1lbnRh
bC4KPiA+Cj4gPiBpdCdzIGxlc3MgZXhwZXJpbWVudGFsIHRoYW4gaW5jb21wbGV0ZS4gSXQgc2Vl
bXMgcHJldHR5IGNsZWFybHkgbm90Cj4gPiB0aGUgd2F5IGl0IHdpbGwgd29yayBkb3duIHRoZSBy
b2FkLCB3ZSBkb24ndCB3YW50IHN2cSBpbnZvbHZlZAo+ID4gYXQgYWxsIHRpbWVzLgo+IAo+IFJp
Z2h0LCBidXQgU1ZRIGNvdWxkIGJlIHVzZWQgZm9yIG90aGVyIHBsYWNlcyBlLmcgcHJvdmlkaW5n
IG1pZ3JhdGlvbgo+IGNvbXBhdGliaWxpdHkgd2hlbiB0aGUgZGVzdGluYXRpb24gbGFja3Mgc29t
ZSBmZWF0dXJlcy4KCkluIGl0cyBjdXJyZW50IGZvcm0/IEkgZG9uJ3Qgc2VlIGhvdy4gIEdlbmVy
YWxseT8gTWF5YmUgYnV0IEkgc3VzcGVjdAp3ZSdsbCBoYXZlIHRvIHJld29yayBpdCBjb21wbGV0
ZWx5IGZvciB0aGF0LgoKPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGUgSU9WQSB0cmljayBkb2VzIG5v
dCBmZWVsIGNvbXBsZXRlIGVpdGhlci4KPiA+ID4KPiA+ID4gSSBkb24ndCBnZXQgaGVyZS4gV2Ug
ZG9uJ3QgdXNlIGFueSBJT1ZBIHRyaWNrIGFzIERQREsgKGl0IHJlc2VydmUgSU9WQQo+ID4gPiBm
b3Igc2hhZG93IHZxKSBkaWQuIFNvIHdlIHdvbid0IHN1ZmZlciBmcm9tIHRoZSBpc3N1ZXMgb2Yg
RFBESy4KPiA+ID4KPiA+ID4gVGhhbmtzCj4gPgo+ID4gTWF5YmUgSSBtaXN1bmRyc3RhbmQgaG93
IHRoaXMgYWxsIHdvcmtzLgo+ID4gSSByZWZlciB0byBhbGwgdGhlIGlvdmFfdHJlZV9hbGxvY19t
YXAgdGhpbmdzLgo+IAo+IEl0J3MgYSBzaW1wbGUgSU9WQSBhbGxvY2F0ZXIgYWN0dWFsbHkuIEFu
eXRoaW5nIHdyb25nIHdpdGggdGhhdD8KCk5vdCBieSBpdHNlbGYgYnV0IEknbSBub3Qgc3VyZSB3
ZSBjYW4gZ3VhcmFudGVlIGd1ZXN0IHdpbGwgbm90CmF0dGVtcHQgdG8gdXNlIHRoZSBJT1ZBIGFk
ZHJlc3NlcyB3ZSBhcmUgcmVzZXJ2aW5nIGRvd24KdGhlIHJvYWQuCgo+IEknbSBmaW5lIHdpdGgg
bWFraW5nIGl0IGZvciB0aGUgZnV0dXJlIHJlbGVhc2UuCj4gCj4gVGhhbmtzCj4gCj4gPgo+ID4g
PiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUT0RPIG9uIGZ1dHVyZSBzZXJp
ZXM6Cj4gPiA+ID4gPiA+ICogRXZlbnQsIGluZGlyZWN0LCBwYWNrZWQsIGFuZCBvdGhlcnMgZmVh
dHVyZXMgb2YgdmlydGlvLgo+ID4gPiA+ID4gPiAqIFRvIHN1cHBvcnQgZGlmZmVyZW50IHNldCBv
ZiBmZWF0dXJlcyBiZXR3ZWVuIHRoZSBkZXZpY2U8LT5TVlEgYW5kIHRoZQo+ID4gPiA+ID4gPiAg
ICBTVlE8LT5ndWVzdCBjb21tdW5pY2F0aW9uLgo+ID4gPiA+ID4gPiAqIFN1cHBvcnQgb2YgZGV2
aWNlIGhvc3Qgbm90aWZpZXIgbWVtb3J5IHJlZ2lvbnMuCj4gPiA+ID4gPiA+ICogVG8gc2VwcGFy
YXRlIGJ1ZmZlcnMgZm9yd2FyZGluZyBpbiBpdHMgb3duIEFJTyBjb250ZXh0LCBzbyB3ZSBjYW4K
PiA+ID4gPiA+ID4gICAgdGhyb3cgbW9yZSB0aHJlYWRzIHRvIHRoYXQgdGFzayBhbmQgd2UgZG9u
J3QgbmVlZCB0byBzdG9wIHRoZSBtYWluCj4gPiA+ID4gPiA+ICAgIGV2ZW50IGxvb3AuCj4gPiA+
ID4gPiA+ICogU3VwcG9ydCBtdWx0aXF1ZXVlIHZpcnRpby1uZXQgdmRwYS4KPiA+ID4gPiA+ID4g
KiBQcm9wZXIgZG9jdW1lbnRhdGlvbi4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2hhbmdlcyBm
cm9tIHY0Ogo+ID4gPiA+ID4gPiAqIEl0ZXJhdGUgaW92YS0+aHZhIHRyZWUgaW5zdGVhZCBvbiBt
YWludGFpbiBvd24gdHJlZSBzbyB3ZSBzdXBwb3J0IEhWQQo+ID4gPiA+ID4gPiAgICBvdmVybGFw
cy4KPiA+ID4gPiA+ID4gKiBGaXg6IEVycm5vIGNvbXBsZXRpb24gYXQgZmFpbHVyZS4KPiA+ID4g
PiA+ID4gKiBSZW5hbWUgeC1zdnEgdG8gc3ZxLCBzbyBjaGFuZ2VzIHRvIHN0YWJsZSBkb2VzIG5v
dCBhZmZlY3QgY21kbGluZSBwYXJhbWV0ZXIuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IENoYW5n
ZXMgZnJvbSB2MzoKPiA+ID4gPiA+ID4gKiBBZGQgQHVuc3RhYmxlIGZlYXR1cmUgdG8gTmV0ZGV2
Vmhvc3RWRFBBT3B0aW9ucy54LXN2cS4KPiA+ID4gPiA+ID4gKiBGaXggdW5jb21wbGV0ZSBtYXBw
aW5nIChieSAxIGJ5dGUpIG9mIG1lbW9yeSByZWdpb25zIGlmIHN2cSBpcyBlbmFibGVkLgo+ID4g
PiA+ID4gPiB2MyBsaW5rOgo+ID4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11
LWRldmVsLzIwMjIwMzAyMjAzMDEyLjM0NzY4MzUtMS1lcGVyZXptYUByZWRoYXQuY29tLwo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBDaGFuZ2VzIGZyb20gdjI6Cj4gPiA+ID4gPiA+ICogTGVzcyBh
c3NlcnRpb25zIGFuZCBtb3JlIGVycm9yIGhhbmRsaW5nIGluIGlvdmEgdHJlZSBjb2RlLgo+ID4g
PiA+ID4gPiAqIEJldHRlciBkb2N1bWVudGF0aW9uLCBib3RoIGZpeGluZyBlcnJvcnMgYW5kIG1h
a2luZyBAcGFyYW06IGZvcm1hdAo+ID4gPiA+ID4gPiAqIEhvbW9nZW5laXplIFNWUSBhdmFpbF9p
ZHhfc2hhZG93IGFuZCBzaGFkb3dfdXNlZF9pZHggdG8gbWFrZSBzaGFkb3cgYQo+ID4gPiA+ID4g
PiAgICBwcmVmaXggYXQgYm90aCB0aW1lcy4KPiA+ID4gPiA+ID4gKiBGaXg6IEZvIG5vdCB1c2Ug
VmlydFF1ZXVlRWxlbWVudC0+bGVuIGZpZWxkLCB0cmFjayBzZXBhcmF0ZWRseS4KPiA+ID4gPiA+
ID4gKiBTcGxpdCB2aG9zdF9zdnFfe2VuYWJsZSxkaXNhYmxlfV9ub3RpZmljYXRpb24sIHNvIHRo
ZSBjb2RlIGxvb2tzIG1vcmUKPiA+ID4gPiA+ID4gICAgbGlrZSB0aGUga2VybmVsIGRyaXZlciBj
b2RlLgo+ID4gPiA+ID4gPiAqIFNtYWxsIGltcHJvdmVtZW50cy4KPiA+ID4gPiA+ID4gdjIgbGlu
azoKPiA+ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBSmFxeVdmWEhFMEM1
NFJfLU9pd0p6akMwZ1Bwa0UzZVgwTDhCZWVaWEdtMUVSWVB0QUBtYWlsLmdtYWlsLmNvbS8KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2hhbmdlcyBmcm9tIHYxOgo+ID4gPiA+ID4gPiAqIEZlYXR1
cmUgc2V0IGF0IGRldmljZS0+U1ZRIGlzIG5vdyB0aGUgc2FtZSBhcyBTVlEtPmd1ZXN0Lgo+ID4g
PiA+ID4gPiAqIFNpemUgb2YgU1ZRIGlzIG5vdCBtYXggYXZhaWxhYmxlIGRldmljZSBzaXplIGFu
eW1vcmUsIGJ1dCBndWVzdCdzCj4gPiA+ID4gPiA+ICAgIG5lZ290aWF0ZWQuCj4gPiA+ID4gPiA+
ICogQWRkIFZIT1NUX0ZJTEVfVU5CSU5EIGtpY2sgYW5kIGNhbGwgZmQgdHJlYXRtZW50Lgo+ID4g
PiA+ID4gPiAqIE1ha2UgU1ZRIGEgcHVibGljIHN0cnVjdAo+ID4gPiA+ID4gPiAqIENvbWUgYmFj
ayB0byBwcmV2aW91cyBhcHByb2FjaCB0byBpb3ZhLXRyZWUKPiA+ID4gPiA+ID4gKiBTb21lIGFz
c2VydGlvbnMgYXJlIG5vdyBmYWlsIHBhdGhzLiBTb21lIGVycm9ycyBhcmUgbm93IGxvZ19ndWVz
dC4KPiA+ID4gPiA+ID4gKiBPbmx5IG1hc2sgX0ZfTE9HIGZlYXR1cmUgYXQgdmRwYV9zZXRfZmVh
dHVyZXMgc3ZxIGVuYWJsZSBwYXRoLgo+ID4gPiA+ID4gPiAqIFJlZmFjdG9yIHNvbWUgZXJyb3Jz
IGFuZCBtZXNzYWdlcy4gQWRkIG1pc3NpbmcgZXJyb3IgdW53aW5kaW5ncy4KPiA+ID4gPiA+ID4g
KiBBZGQgbWVtb3J5IGJhcnJpZXIgYXQgX0ZfTk9fTk9USUZZIHNldC4KPiA+ID4gPiA+ID4gKiBT
dG9wIGNoZWNraW5nIGZvciBmZWF0dXJlcyBmbGFncyBvdXQgb2YgdHJhbnNwb3J0IHJhbmdlLgo+
ID4gPiA+ID4gPiB2MSBsaW5rOgo+ID4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy92
aXJ0dWFsaXphdGlvbi83ZDg2YzcxNS02ZDcxLThhMjctOTFmNS04ZDQ3YjcxZTMyMDFAcmVkaGF0
LmNvbS8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2hhbmdlcyBmcm9tIHY0IFJGQzoKPiA+ID4g
PiA+ID4gKiBTdXBwb3J0IG9mIGFsbG9jYXRpbmcgLyBmcmVlaW5nIGlvdmEgcmFuZ2VzIGluIElP
VkEgdHJlZS4gRXh0ZW5kaW5nCj4gPiA+ID4gPiA+ICAgIGFscmVhZHkgcHJlc2VudCBpb3ZhLXRy
ZWUgZm9yIHRoYXQuCj4gPiA+ID4gPiA+ICogUHJvcGVyIHZhbGlkYXRpb24gb2YgZ3Vlc3QgZmVh
dHVyZXMuIE5vdyBTVlEgY2FuIG5lZ290aWF0ZSBhCj4gPiA+ID4gPiA+ICAgIGRpZmZlcmVudCBz
ZXQgb2YgZmVhdHVyZXMgd2l0aCB0aGUgZGV2aWNlIHdoZW4gZW5hYmxlZC4KPiA+ID4gPiA+ID4g
KiBTdXBwb3J0IG9mIGhvc3Qgbm90aWZpZXJzIG1lbW9yeSByZWdpb25zCj4gPiA+ID4gPiA+ICog
SGFuZGxpbmcgb2YgU1ZRIGZ1bGwgcXVldWUgaW4gY2FzZSBndWVzdCdzIGRlc2NyaXB0b3JzIHNw
YW4gdG8KPiA+ID4gPiA+ID4gICAgZGlmZmVyZW50IG1lbW9yeSByZWdpb25zIChxZW11J3MgVkEg
Y2h1bmtzKS4KPiA+ID4gPiA+ID4gKiBGbHVzaCBwZW5kaW5nIHVzZWQgYnVmZmVycyBhdCBlbmQg
b2YgU1ZRIG9wZXJhdGlvbi4KPiA+ID4gPiA+ID4gKiBRTVAgY29tbWFuZCBub3cgbG9va3MgYnkg
TmV0Q2xpZW50U3RhdGUgbmFtZS4gT3RoZXIgZGV2aWNlcyB3aWxsIG5lZWQKPiA+ID4gPiA+ID4g
ICAgdG8gaW1wbGVtZW50IGl0J3Mgd2F5IHRvIGVuYWJsZSB2ZHBhLgo+ID4gPiA+ID4gPiAqIFJl
bmFtZSBRTVAgY29tbWFuZCB0byBzZXQsIHNvIGl0IGxvb2tzIG1vcmUgbGlrZSBhIHdheSBvZiB3
b3JraW5nCj4gPiA+ID4gPiA+ICogQmV0dGVyIHVzZSBvZiBxZW11IGVycm9yIHN5c3RlbQo+ID4g
PiA+ID4gPiAqIE1ha2UgYSBmZXcgYXNzZXJ0aW9ucyBwcm9wZXIgZXJyb3ItaGFuZGxpbmcgcGF0
aHMuCj4gPiA+ID4gPiA+ICogQWRkIG1vcmUgZG9jdW1lbnRhdGlvbgo+ID4gPiA+ID4gPiAqIExl
c3MgY291cGxpbmcgb2YgdmlydGlvIC8gdmhvc3QsIHRoYXQgY291bGQgY2F1c2UgZnJpY3Rpb24g
b24gY2hhbmdlcwo+ID4gPiA+ID4gPiAqIEFkZHJlc3NlZCBtYW55IG90aGVyIHNtYWxsIGNvbW1l
bnRzIGFuZCBzbWFsbCBmaXhlcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQ2hhbmdlcyBmcm9t
IHYzIFJGQzoKPiA+ID4gPiA+ID4gICAgKiBNb3ZlIGV2ZXJ5dGhpbmcgdG8gdmhvc3QtdmRwYSBi
YWNrZW5kLiBBIGJpZyBjaGFuZ2UsIHRoaXMgYWxsb3dlZAo+ID4gPiA+ID4gPiAgICAgIHNvbWUg
Y2xlYW51cCBidXQgbW9yZSBjb2RlIGhhcyBiZWVuIGFkZGVkIGluIG90aGVyIHBsYWNlcy4KPiA+
ID4gPiA+ID4gICAgKiBNb3JlIHVzZSBvZiBnbGliIHV0aWxpdGllcywgZXNwZWNpYWxseSB0byBt
YW5hZ2UgbWVtb3J5Lgo+ID4gPiA+ID4gPiB2MyBsaW5rOgo+ID4gPiA+ID4gPiBodHRwczovL2xp
c3RzLm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wNS9tc2cwNjAzMi5o
dG1sCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IENoYW5nZXMgZnJvbSB2MiBSRkM6Cj4gPiA+ID4g
PiA+ICAgICogQWRkaW5nIHZob3N0LXZkcGEgZGV2aWNlcyBzdXBwb3J0Cj4gPiA+ID4gPiA+ICAg
ICogRml4ZWQgc29tZSBtZW1vcnkgbGVha3MgcG9pbnRlZCBieSBkaWZmZXJlbnQgY29tbWVudHMK
PiA+ID4gPiA+ID4gdjIgbGluazoKPiA+ID4gPiA+ID4gaHR0cHM6Ly9saXN0cy5ub25nbnUub3Jn
L2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjEtMDMvbXNnMDU2MDAuaHRtbAo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBDaGFuZ2VzIGZyb20gdjEgUkZDOgo+ID4gPiA+ID4gPiAgICAqIFVzZSBR
TVAgaW5zdGVhZCBvZiBtaWdyYXRpb24gdG8gc3RhcnQgU1ZRIG1vZGUuCj4gPiA+ID4gPiA+ICAg
ICogT25seSBhY2NlcHRpbmcgSU9NTVUgZGV2aWNlcywgY2xvc2VyIGJlaGF2aW9yIHdpdGggdGFy
Z2V0IGRldmljZXMKPiA+ID4gPiA+ID4gICAgICAodkRQQSkKPiA+ID4gPiA+ID4gICAgKiBGaXgg
aW52YWxpZCBtYXNraW5nL3VubWFza2luZyBvZiB2aG9zdCBjYWxsIGZkLgo+ID4gPiA+ID4gPiAg
ICAqIFVzZSBvZiBwcm9wZXIgbWV0aG9kcyBmb3Igc3luY2hyb25pemF0aW9uLgo+ID4gPiA+ID4g
PiAgICAqIE5vIG5lZWQgdG8gbW9kaWZ5IFZpcnRJTyBkZXZpY2UgY29kZSwgYWxsIG9mIHRoZSBj
aGFuZ2VzIGFyZQo+ID4gPiA+ID4gPiAgICAgIGNvbnRhaW5lZCBpbiB2aG9zdCBjb2RlLgo+ID4g
PiA+ID4gPiAgICAqIERlbGV0ZSBzdXBlcmZsdW91cyBjb2RlLgo+ID4gPiA+ID4gPiAgICAqIEFu
IGludGVybWVkaWF0ZSBSRkMgd2FzIHNlbnQgd2l0aCBvbmx5IHRoZSBub3RpZmljYXRpb25zIGZv
cndhcmRpbmcKPiA+ID4gPiA+ID4gICAgICBjaGFuZ2VzLiBJdCBjYW4gYmUgc2VlbiBpbgo+ID4g
PiA+ID4gPiAgICAgIGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyOTIwNTQxNS44NzYy
OTAtMS1lcGVyZXptYUByZWRoYXQuY29tLwo+ID4gPiA+ID4gPiB2MSBsaW5rOgo+ID4gPiA+ID4g
PiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMC0xMS9t
c2cwNTM3Mi5odG1sCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEV1Z2VuaW8gUMOpcmV6ICgyMCk6
Cj4gPiA+ID4gPiA+ICAgICAgICB2aXJ0aW86IEFkZCBWSVJUSU9fRl9RVUVVRV9TVEFURQo+ID4g
PiA+ID4gPiAgICAgICAgdmlydGlvLW5ldDogSG9ub3IgVklSVElPX0NPTkZJR19TX0RFVklDRV9T
VE9QUEVECj4gPiA+ID4gPiA+ICAgICAgICB2aXJ0aW86IEFkZCB2aXJ0aW9fcXVldWVfaXNfaG9z
dF9ub3RpZmllcl9lbmFibGVkCj4gPiA+ID4gPiA+ICAgICAgICB2aG9zdDogTWFrZSB2aG9zdF92
aXJ0cXVldWVfe3N0YXJ0LHN0b3B9IHB1YmxpYwo+ID4gPiA+ID4gPiAgICAgICAgdmhvc3Q6IEFk
ZCB4LXZob3N0LWVuYWJsZS1zaGFkb3ctdnEgcW1wCj4gPiA+ID4gPiA+ICAgICAgICB2aG9zdDog
QWRkIFZob3N0U2hhZG93VmlydHF1ZXVlCj4gPiA+ID4gPiA+ICAgICAgICB2ZHBhOiBSZWdpc3Rl
ciB2ZHBhIGRldmljZXMgaW4gYSBsaXN0Cj4gPiA+ID4gPiA+ICAgICAgICB2aG9zdDogUm91dGUg
Z3Vlc3QtPmhvc3Qgbm90aWZpY2F0aW9uIHRocm91Z2ggc2hhZG93IHZpcnRxdWV1ZQo+ID4gPiA+
ID4gPiAgICAgICAgQWRkIHZob3N0X3N2cV9nZXRfc3ZxX2NhbGxfbm90aWZpZXIKPiA+ID4gPiA+
ID4gICAgICAgIEFkZCB2aG9zdF9zdnFfc2V0X2d1ZXN0X2NhbGxfbm90aWZpZXIKPiA+ID4gPiA+
ID4gICAgICAgIHZkcGE6IFNhdmUgY2FsbF9mZCBpbiB2aG9zdC12ZHBhCj4gPiA+ID4gPiA+ICAg
ICAgICB2aG9zdC12ZHBhOiBUYWtlIGludG8gYWNjb3VudCBTVlEgaW4gdmhvc3RfdmRwYV9zZXRf
dnJpbmdfY2FsbAo+ID4gPiA+ID4gPiAgICAgICAgdmhvc3Q6IFJvdXRlIGhvc3QtPmd1ZXN0IG5v
dGlmaWNhdGlvbiB0aHJvdWdoIHNoYWRvdyB2aXJ0cXVldWUKPiA+ID4gPiA+ID4gICAgICAgIHZp
cnRpbzogQWRkIHZob3N0X3NoYWRvd192cV9nZXRfdnJpbmdfYWRkcgo+ID4gPiA+ID4gPiAgICAg
ICAgdmRwYTogU2F2ZSBob3N0IGFuZCBndWVzdCBmZWF0dXJlcwo+ID4gPiA+ID4gPiAgICAgICAg
dmhvc3Q6IEFkZCB2aG9zdF9zdnFfdmFsaWRfZGV2aWNlX2ZlYXR1cmVzIHRvIHNoYWRvdyB2cQo+
ID4gPiA+ID4gPiAgICAgICAgdmhvc3Q6IFNoYWRvdyB2aXJ0cXVldWUgYnVmZmVycyBmb3J3YXJk
aW5nCj4gPiA+ID4gPiA+ICAgICAgICB2aG9zdDogQWRkIFZob3N0SU9WQVRyZWUKPiA+ID4gPiA+
ID4gICAgICAgIHZob3N0OiBVc2UgYSB0cmVlIHRvIHN0b3JlIG1lbW9yeSBtYXBwaW5ncwo+ID4g
PiA+ID4gPiAgICAgICAgdmRwYTogQWRkIGN1c3RvbSBJT1RMQiB0cmFuc2xhdGlvbnMgdG8gU1ZR
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEV1Z2VuaW8gUMOpcmV6ICgxNSk6Cj4gPiA+ID4gPiA+
ICAgIHZob3N0OiBBZGQgVmhvc3RTaGFkb3dWaXJ0cXVldWUKPiA+ID4gPiA+ID4gICAgdmhvc3Q6
IEFkZCBTaGFkb3cgVmlydFF1ZXVlIGtpY2sgZm9yd2FyZGluZyBjYXBhYmlsaXRpZXMKPiA+ID4g
PiA+ID4gICAgdmhvc3Q6IEFkZCBTaGFkb3cgVmlydFF1ZXVlIGNhbGwgZm9yd2FyZGluZyBjYXBh
YmlsaXRpZXMKPiA+ID4gPiA+ID4gICAgdmhvc3Q6IEFkZCB2aG9zdF9zdnFfdmFsaWRfZmVhdHVy
ZXMgdG8gc2hhZG93IHZxCj4gPiA+ID4gPiA+ICAgIHZpcnRpbzogQWRkIHZob3N0X3N2cV9nZXRf
dnJpbmdfYWRkcgo+ID4gPiA+ID4gPiAgICB2ZHBhOiBhZGFwdCB2aG9zdF9vcHMgY2FsbGJhY2tz
IHRvIHN2cQo+ID4gPiA+ID4gPiAgICB2aG9zdDogU2hhZG93IHZpcnRxdWV1ZSBidWZmZXJzIGZv
cndhcmRpbmcKPiA+ID4gPiA+ID4gICAgdXRpbDogQWRkIGlvdmFfdHJlZV9hbGxvY19tYXAKPiA+
ID4gPiA+ID4gICAgdXRpbDogYWRkIGlvdmFfdHJlZV9maW5kX2lvdmEKPiA+ID4gPiA+ID4gICAg
dmhvc3Q6IEFkZCBWaG9zdElPVkFUcmVlCj4gPiA+ID4gPiA+ICAgIHZkcGE6IEFkZCBjdXN0b20g
SU9UTEIgdHJhbnNsYXRpb25zIHRvIFNWUQo+ID4gPiA+ID4gPiAgICB2ZHBhOiBBZGFwdCB2aG9z
dF92ZHBhX2dldF92cmluZ19iYXNlIHRvIFNWUQo+ID4gPiA+ID4gPiAgICB2ZHBhOiBOZXZlciBz
ZXQgbG9nX2Jhc2UgYWRkciBpZiBTVlEgaXMgZW5hYmxlZAo+ID4gPiA+ID4gPiAgICB2ZHBhOiBF
eHBvc2UgVkhPU1RfRl9MT0dfQUxMIG9uIFNWUQo+ID4gPiA+ID4gPiAgICB2ZHBhOiBBZGQgeC1z
dnEgdG8gTmV0ZGV2Vmhvc3RWRFBBT3B0aW9ucwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgIHFh
cGkvbmV0Lmpzb24gICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KPiA+ID4gPiA+ID4gICBo
dy92aXJ0aW8vdmhvc3QtaW92YS10cmVlLmggICAgICAgIHwgIDI3ICsrCj4gPiA+ID4gPiA+ICAg
aHcvdmlydGlvL3Zob3N0LXNoYWRvdy12aXJ0cXVldWUuaCB8ICA4NyArKysrCj4gPiA+ID4gPiA+
ICAgaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdmRwYS5oICAgICB8ICAgOCArCj4gPiA+ID4gPiA+
ICAgaW5jbHVkZS9xZW11L2lvdmEtdHJlZS5oICAgICAgICAgICB8ICAzOCArLQo+ID4gPiA+ID4g
PiAgIGh3L3ZpcnRpby92aG9zdC1pb3ZhLXRyZWUuYyAgICAgICAgfCAxMTAgKysrKysKPiA+ID4g
PiA+ID4gICBody92aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1ZS5jIHwgNjM3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+ICAgaHcvdmlydGlvL3Zob3N0LXZkcGEu
YyAgICAgICAgICAgICB8IDUyNSArKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ID4gPiA+ID4g
ICBuZXQvdmhvc3QtdmRwYS5jICAgICAgICAgICAgICAgICAgIHwgIDQ4ICsrLQo+ID4gPiA+ID4g
PiAgIHV0aWwvaW92YS10cmVlLmMgICAgICAgICAgICAgICAgICAgfCAxNjkgKysrKysrKysKPiA+
ID4gPiA+ID4gICBody92aXJ0aW8vbWVzb24uYnVpbGQgICAgICAgICAgICAgIHwgICAyICstCj4g
PiA+ID4gPiA+ICAgMTEgZmlsZXMgY2hhbmdlZCwgMTYzMyBpbnNlcnRpb25zKCspLCAyNiBkZWxl
dGlvbnMoLSkKPiA+ID4gPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvdmlydGlvL3Zob3N0
LWlvdmEtdHJlZS5oCj4gPiA+ID4gPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L3ZpcnRpby92
aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmgKPiA+ID4gPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
aHcvdmlydGlvL3Zob3N0LWlvdmEtdHJlZS5jCj4gPiA+ID4gPiA+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGh3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmMKPiA+ID4gPiA+ID4KPiA+ID4g
Pgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
