Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C818C1AD936
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 10:57:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4CF2385608;
	Fri, 17 Apr 2020 08:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8za2h2G1F_pa; Fri, 17 Apr 2020 08:57:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A39E28574A;
	Fri, 17 Apr 2020 08:57:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A617C0172;
	Fri, 17 Apr 2020 08:57:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 652D0C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 58CA720031
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZejvcDBbQjs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:57:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 09EF320243
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57oFuPD/q+SMkeSS1ok5ufPqZbzHPN868lU8tZLRaro=;
 b=VZdrBjrZrkRkxSOQbWx1KTvjdExhJWTtZAJYUv3c30/DNe1rj61BDiTn2w7yDYx2ghur1G
 Kd9kEwHUi7vEqmppZ1vGjTY3jbEgVAjsGqjtXF9umDW2+dxniPZhac8uoU23vt0qqdZdx8
 IYrf/TjwQlyuVSRS9fjBbEYcJOtioXk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-GJzBZa03N6ywAt2inWXOCg-1; Fri, 17 Apr 2020 04:57:46 -0400
X-MC-Unique: GJzBZa03N6ywAt2inWXOCg-1
Received: by mail-wm1-f70.google.com with SMTP id o26so557114wmh.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 01:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=57oFuPD/q+SMkeSS1ok5ufPqZbzHPN868lU8tZLRaro=;
 b=YQuuvIux3hjg70XrcjvSNUiA9yX+Wf4+5/zIwSvhntQLgivupf/6CXCUa75Nv0CG9J
 RNc6qNumLRO8lR4JSd6LBKj5PQW7+MUO5dk9oeBz9wMVPB3TdfWAjt1Bkt3JtX6t12k6
 TGFPa53QCsXhk6SnhBZtbrzFZm7h5NOkePrQbu35Wq5xjiM+KtCFpYslmoScUfOep6Mj
 kCVsLi3hX1bZNXilYeM4UyXNxtG+J9NJmWwr9EAnLCFaCvyPa4MV+N1lEkXgUoQDDAIr
 Nfcg4RP0wkaYJAoWkNGjymw4MS3ou4d8jQIGYmke60E9aNFr/f+v7FcNiShoFxmvtEQP
 47uw==
X-Gm-Message-State: AGi0PubIc3puihfx3FCVMddBG8k0zQO3mvvc+9+HrRqy+d46QNpigEXE
 VrgaTIiSpucO6rGL6D0la8ZYxrY6L3aF/6iuAl0JLuBaHVxZa9G3Ulv8Igz8Hi9zoVhCQIyjXdm
 hCnIokOIAz/tLeNx324ShU0x6Y55SW3+zPJ9ODbEhgQ==
X-Received: by 2002:a05:600c:4096:: with SMTP id
 k22mr2101846wmh.99.1587113865721; 
 Fri, 17 Apr 2020 01:57:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzNTX8c8fQ/vBkdSzMi35lJDuNvId/TTHeWg1TQWoHgILbrk1iRbqaecBOrIQnqlWsFeqPPQ==
X-Received: by 2002:a05:600c:4096:: with SMTP id
 k22mr2101824wmh.99.1587113865518; 
 Fri, 17 Apr 2020 01:57:45 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id n6sm31931548wrs.81.2020.04.17.01.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:57:44 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:57:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417045454-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
MIME-Version: 1.0
In-Reply-To: <73843240-3040-655d-baa9-683341ed4786@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6NTE6MTlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMTcg5LiL5Y2INDo0NiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6Mzk6NDlQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC80LzE3IOS4i+WNiDQ6MjksIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEFwciAxNywgMjAyMCBhdCAwMzozNjo1MlBNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAyMC80LzE3IOS4i+WNiDI6MzMsIE1p
Y2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCBBcHIgMTcsIDIwMjAg
YXQgMTE6MTI6MTRBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiAy
MDIwLzQvMTcg5LiK5Y2INjo1NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPiA+ID4g
PiA+ID4gT24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgMTA6NDM6NTZBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gV2UgdHJ5IHRvIGtlZXAgdGhlIGRlZmNvbmZpZyB1
bnRvdWNoZWQgYWZ0ZXIgZGVjb3VwbGluZyBDT05GSUdfVkhPU1QKPiA+ID4gPiA+ID4gPiA+ID4g
b3V0IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTiBpbiBjb21taXQgMjBjMzg0ZjFlYTFhCj4gPiA+
ID4gPiA+ID4gPiA+ICgidmhvc3Q6IHJlZmluZSB2aG9zdCBhbmQgdnJpbmdoIGtjb25maWciKSBi
eSBlbmFibGluZyBWSE9TVF9NRU5VIGJ5Cj4gPiA+ID4gPiA+ID4gPiA+IGRlZmF1bHQuIFRoZW4g
dGhlIGRlZmNvbmZpZ3MgY2FuIGtlZXAgZW5hYmxpbmcgQ09ORklHX1ZIT1NUX05FVAo+ID4gPiA+
ID4gPiA+ID4gPiB3aXRob3V0IHRoZSBjYXJpbmcgb2YgQ09ORklHX1ZIT1NULgo+ID4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gQnV0IHRoaXMgd2lsbCBsZWF2ZSBhICJDT05GSUdf
VkhPU1RfTUVOVT15IiBpbiBhbGwgZGVmY29uZmlncyBhbmQgZXZlbgo+ID4gPiA+ID4gPiA+ID4g
PiBmb3IgdGhlIG9uZXMgdGhhdCBkb2Vzbid0IHdhbnQgdmhvc3QuIFNvIGl0IGFjdHVhbGx5IHNo
aWZ0cyB0aGUKPiA+ID4gPiA+ID4gPiA+ID4gYnVyZGVucyB0byB0aGUgbWFpbnRhaW5lcnMgb2Yg
YWxsIG90aGVyIHRvIGFkZCAiQ09ORklHX1ZIT1NUX01FTlUgaXMKPiA+ID4gPiA+ID4gPiA+ID4g
bm90IHNldCIuIFNvIHRoaXMgcGF0Y2ggdHJpZXMgdG8gZW5hYmxlIENPTkZJR19WSE9TVCBleHBs
aWNpdGx5IGluCj4gPiA+ID4gPiA+ID4gPiA+IGRlZmNvbmZpZ3MgdGhhdCBlbmFibGVzIENPTkZJ
R19WSE9TVF9ORVQgYW5kIENPTkZJR19WSE9TVF9WU09DSy4KPiA+ID4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4gQm9ybnRyYWVnZXI8Ym9ybnRyYWVn
ZXJAZGUuaWJtLmNvbT4gICAoczM5MCkKPiA+ID4gPiA+ID4gPiA+ID4gQWNrZWQtYnk6IE1pY2hh
ZWwgRWxsZXJtYW48bXBlQGVsbGVybWFuLmlkLmF1PiAgIChwb3dlcnBjKQo+ID4gPiA+ID4gPiA+
ID4gPiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlcjx0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRlPgo+
ID4gPiA+ID4gPiA+ID4gPiBDYzogQmVuamFtaW4gSGVycmVuc2NobWlkdDxiZW5oQGtlcm5lbC5j
cmFzaGluZy5vcmc+Cj4gPiA+ID4gPiA+ID4gPiA+IENjOiBQYXVsIE1hY2tlcnJhczxwYXVsdXNA
c2FtYmEub3JnPgo+ID4gPiA+ID4gPiA+ID4gPiBDYzogTWljaGFlbCBFbGxlcm1hbjxtcGVAZWxs
ZXJtYW4uaWQuYXU+Cj4gPiA+ID4gPiA+ID4gPiA+IENjOiBIZWlrbyBDYXJzdGVuczxoZWlrby5j
YXJzdGVuc0BkZS5pYm0uY29tPgo+ID4gPiA+ID4gPiA+ID4gPiBDYzogVmFzaWx5IEdvcmJpazxn
b3JAbGludXguaWJtLmNvbT4KPiA+ID4gPiA+ID4gPiA+ID4gQ2M6IENocmlzdGlhbiBCb3JudHJh
ZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29tPgo+ID4gPiA+ID4gPiA+ID4gPiBSZXBvcnRlZC1i
eTogR2VlcnQgVXl0dGVyaG9ldmVuPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gPiA+ID4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+
ID4gPiA+ID4gPiBJIHJlYmFzZWQgdGhpcyBvbiB0b3Agb2YgT0FCSSBmaXggc2luY2UgdGhhdAo+
ID4gPiA+ID4gPiA+ID4gc2VlbXMgbW9yZSBvcmdlbnQgdG8gZml4Lgo+ID4gPiA+ID4gPiA+ID4g
UHVzaGVkIHRvIG15IHZob3N0IGJyYW5jaCBwbHMgdGFrZSBhIGxvb2sgYW5kCj4gPiA+ID4gPiA+
ID4gPiBpZiBwb3NzaWJsZSB0ZXN0Lgo+ID4gPiA+ID4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+ID4g
PiA+IEkgdGVzdCB0aGlzIHBhdGNoIGJ5IGdlbmVyYXRpbmcgdGhlIGRlZmNvbmZpZ3MgdGhhdCB3
YW50cyB2aG9zdF9uZXQgb3IKPiA+ID4gPiA+ID4gPiB2aG9zdF92c29jay4gQWxsIGxvb2tzIGZp
bmUuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQnV0IGhhdmluZyBDT05GSUdfVkhPU1Rf
RFBOPXkgbWF5IGVuZCB1cCB3aXRoIHRoZSBzaW1pbGFyIHNpdHVhdGlvbiB0aGF0Cj4gPiA+ID4g
PiA+ID4gdGhpcyBwYXRjaCB3YW50IHRvIGFkZHJlc3MuCj4gPiA+ID4gPiA+ID4gTWF5YmUgd2Ug
Y2FuIGxldCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiAhQVJNIHx8IEFFQUJJIHRoZW4gYWRkIGFu
b3RoZXIKPiA+ID4gPiA+ID4gPiBtZW51Y29uZmlnIGZvciBWSE9TVF9SSU5HIGFuZCBkbyBzb21l
dGhpbmcgc2ltaWxhcj8KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGFua3MKPiA+ID4g
PiA+ID4gU29ycnkgSSBkb24ndCB1bmRlcnN0YW5kLiBBZnRlciB0aGlzIHBhdGNoIENPTkZJR19W
SE9TVF9EUE4gaXMganVzdAo+ID4gPiA+ID4gPiBhbiBpbnRlcm5hbCB2YXJpYWJsZSBmb3IgdGhl
IE9BQkkgZml4LiBJIGtlcHQgaXQgc2VwYXJhdGUKPiA+ID4gPiA+ID4gc28gaXQncyBlYXN5IHRv
IHJldmVydCBmb3IgNS44LiBZZXMgd2UgY291bGQgc3F1YXNoIGl0IGludG8KPiA+ID4gPiA+ID4g
VkhPU1QgZGlyZWN0bHkgYnV0IEkgZG9uJ3Qgc2VlIGhvdyB0aGF0IGNoYW5nZXMgbG9naWMgYXQg
YWxsLgo+ID4gPiA+ID4gU29ycnkgZm9yIGJlaW5nIHVuY2xlYXIuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IEkgbWVhbnQgc2luY2UgaXQgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCwgIkNPTkZJR19WSE9T
VF9EUE49eSIgd2lsbCBiZSBsZWZ0Cj4gPiA+ID4gPiBpbiB0aGUgZGVmY29uZmlncy4KPiA+ID4g
PiBCdXQgd2hvIGNhcmVzPwo+ID4gPiBGWUksIHBsZWFzZSBzZWVodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9rdm0vbXNnMjEyNjg1Lmh0bWwKPiA+IFRoZSBjb21wbGFpbnQgd2FzIG5vdCBh
Ym91dCB0aGUgc3ltYm9sIElJVUMuICBJdCB3YXMgdGhhdCB3ZSBjYXVzZWQKPiA+IGV2ZXJ5b25l
IHRvIGJ1aWxkIHZob3N0IHVubGVzcyB0aGV5IG1hbnVhbGx5IGRpc2FibGVkIGl0Lgo+IAo+IAo+
IFRoZXJlIGNvdWxkIGJlIHNvbWUgbWlzdW5kZXJzdGFuZGluZyBoZXJlLiBJIHRob3VnaHQgaXQn
cyBzb21laG93IHNpbWlsYXI6IGEKPiBDT05GSUdfVkhPU1RfTUVOVT15IHdpbGwgYmUgbGVmdCBp
biB0aGUgZGVmY29uZmlncyBldmVuIGlmIENPTkZJR19WSE9TVCBpcwo+IG5vdCBzZXQuCj4gCj4g
VGhhbmtzCgpIbW0uIFNvIGxvb2tpbmcgYXQgRG9jdW1lbnRhdGlvbi9rYnVpbGQva2NvbmZpZy1s
YW5ndWFnZS5yc3QgOgoKICAgICAgICBUaGluZ3MgdGhhdCBtZXJpdCAiZGVmYXVsdCB5L20iIGlu
Y2x1ZGU6CgogICAgICAgIGEpIEEgbmV3IEtjb25maWcgb3B0aW9uIGZvciBzb21ldGhpbmcgdGhh
dCB1c2VkIHRvIGFsd2F5cyBiZSBidWlsdAogICAgICAgICAgIHNob3VsZCBiZSAiZGVmYXVsdCB5
Ii4KCgogICAgICAgIGIpIEEgbmV3IGdhdGVrZWVwaW5nIEtjb25maWcgb3B0aW9uIHRoYXQgaGlk
ZXMvc2hvd3Mgb3RoZXIgS2NvbmZpZwogICAgICAgICAgIG9wdGlvbnMgKGJ1dCBkb2VzIG5vdCBn
ZW5lcmF0ZSBhbnkgY29kZSBvZiBpdHMgb3duKSwgc2hvdWxkIGJlCiAgICAgICAgICAgImRlZmF1
bHQgeSIgc28gcGVvcGxlIHdpbGwgc2VlIHRob3NlIG90aGVyIG9wdGlvbnMuCgogICAgICAgIGMp
IFN1Yi1kcml2ZXIgYmVoYXZpb3Igb3Igc2ltaWxhciBvcHRpb25zIGZvciBhIGRyaXZlciB0aGF0
IGlzCiAgICAgICAgICAgImRlZmF1bHQgbiIuIFRoaXMgYWxsb3dzIHlvdSB0byBwcm92aWRlIHNh
bmUgZGVmYXVsdHMuCgoKU28gaXQgbG9va3MgbGlrZSBWSE9TVF9NRU5VIGlzIGFjdHVhbGx5IG1h
dGNoaW5nIHJ1bGUgYikuClNvIHdoYXQncyB0aGUgcHJvYmxlbSB3ZSBhcmUgdHJ5aW5nIHRvIHNv
bHZlIHdpdGggdGhpcyBwYXRjaCwgZXhhY3RseT8KCkdlZXJ0IGNvdWxkIHlvdSBjbGFyaWZ5IHBs
cz8KCgo+IAo+ID4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
