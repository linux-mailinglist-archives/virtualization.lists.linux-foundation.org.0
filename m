Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E0B6C3A0B
	for <lists.virtualization@lfdr.de>; Tue, 21 Mar 2023 20:13:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D98F4170E;
	Tue, 21 Mar 2023 19:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D98F4170E
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jjetGAeH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZzjCYMHX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQD5wyjUgQyH; Tue, 21 Mar 2023 19:13:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 365E84117C;
	Tue, 21 Mar 2023 19:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365E84117C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 456EEC007E;
	Tue, 21 Mar 2023 19:13:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DADCEC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 19:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEAAD611D0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 19:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEAAD611D0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jjetGAeH; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZzjCYMHX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBIz0WUD49nf
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 19:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B54EB611CC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B54EB611CC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Mar 2023 19:12:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2C6C22522;
 Tue, 21 Mar 2023 19:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679425975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IBwPShFoVSjMgQwqXFVgic34Usa9W4CMVPqaiQcxP1k=;
 b=jjetGAeHDHctkOUrK5Exg5lLjFOYO8lnok0pvVjCEnaGV3igs5qWA/cJ5BpBdu35El1ffE
 73UTbI55bEv5Ptc1P5e/PCK/l0FoWsxGJYnu567cnxG95mA3SRsq1SypPJrhu0d6On1abk
 61JrHLjYTuHhANi3aYd+Jb5/8iXVVG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679425975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IBwPShFoVSjMgQwqXFVgic34Usa9W4CMVPqaiQcxP1k=;
 b=ZzjCYMHX/pUh+5a3hGt1Brv0JTHOB3Pl1Ujaj+Xzmcw1F3XZsAFW0RWC9SSWHX+ZN+ar9U
 gcIwkwOHrRHcJ6Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64E3113440;
 Tue, 21 Mar 2023 19:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Um6eF7cBGmSHVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Mar 2023 19:12:55 +0000
Message-ID: <47641f64-f85c-91ca-d0d1-9262bff77473@suse.de>
Date: Tue, 21 Mar 2023 20:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,1/8] drm/fbdev-generic: Always use shadow buffering
Content-Language: en-US
To: Sui jingfeng <suijingfeng@loongson.cn>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-2-tzimmermann@suse.de>
 <8dff5007-ecbe-ac4f-d063-a4d27c660212@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8dff5007-ecbe-ac4f-d063-a4d27c660212@loongson.cn>
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
Content-Type: multipart/mixed; boundary="===============2339365911665535946=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2339365911665535946==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2dr4o4FjGBAAB8ZK39PLd6tK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2dr4o4FjGBAAB8ZK39PLd6tK
Content-Type: multipart/mixed; boundary="------------L0S86at30PKR50HDDd8qI5N5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui jingfeng <suijingfeng@loongson.cn>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Message-ID: <47641f64-f85c-91ca-d0d1-9262bff77473@suse.de>
Subject: Re: [v2,1/8] drm/fbdev-generic: Always use shadow buffering
References: <20230320150751.20399-2-tzimmermann@suse.de>
 <8dff5007-ecbe-ac4f-d063-a4d27c660212@loongson.cn>
In-Reply-To: <8dff5007-ecbe-ac4f-d063-a4d27c660212@loongson.cn>

--------------L0S86at30PKR50HDDd8qI5N5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGVzdGluZyB0aGUgcGF0Y2hzZXQuDQoNCkFtIDIxLjAzLjIz
IHVtIDE2OjIzIHNjaHJpZWIgU3VpIGppbmdmZW5nOg0KPiANCj4gT24gMjAyMy8zLzIwIDIz
OjA3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IFJlbW92ZSBhbGwgY29kZXBhdGhz
IHRoYXQgaW1wbGVtZW50IGZiZGV2IG91dHB1dCBkaXJlY3RseSBvbiBHRU0NCj4+IGJ1ZmZl
cnMuIEFsd2F5cyBhbGxvY2F0ZSBhIHNoYWRvdyBidWZmZXIgaW4gc3lzdGVtIG1lbW9yeSBh
bmQgc2V0DQo+PiB1cCBkZWZlcnJlZCBJL08gZm9yIG1tYXAuDQo+Pg0KPj4gVGhlIGZiZGV2
IGNvZGUgdGhhdCBvcGVyYXRlZCBkaXJlY3RseSBvbiBHRU0gYnVmZmVycyB3YXMgdXNlZCBi
eQ0KPj4gZHJpdmVycyBiYXNlZCBvbiBHRU0gRE1BIGhlbHBlcnMuIFRob3NlIGRyaXZlcnMg
aGF2ZSBiZWVuIG1pZ3JhdGVkDQo+PiB0byB1c2UgZmJkZXYtZG1hLCBhIGRlZGljYXRlZCBm
YmRldiBlbXVsYXRpb24gZm9yIERNQSBtZW1vcnkuIEFsbA0KPj4gcmVtYWluaW5nIHVzZXJz
IG9mIGZiZGV2LWdlbmVyaWMgcmVxdWlyZSBzaGFkb3cgYnVmZmVyaW5nLg0KPj4NCj4+IE1l
bW9yeSBtYW5hZ2VtZW50IG9mIHRoZSByZW1haW5pbmcgY2FsbGVycyB1c2VzIFRUTSwgR0VN
IFNITUVNDQo+PiBoZWxwZXJzIG9yIGEgdmFyaWFudCBvZiBHRU0gRE1BIGhlbHBlcnMgdGhh
dCBpcyBpbmNvbXBhdGlibGUgd2l0aA0KPj4gZmJkZXYtZG1hLiBUaGVyZWZvcmUgcmVtb3Zl
IHRoZSB1bnVzZWQgY29kZXBhdGhzIGZyb20gZmJkZXYtZ2VuZXJpYw0KPj4gYW5kIHNpbXBs
aWZ5IHRoZSBjb2RlLg0KPj4NCj4+IFVzaW5nIGEgc2hhZG93IGJ1ZmZlciB3aXRoIGRlZmVy
cmVkIEkvTyBpcyBwcm9iYWJseSB0aGUgYmVzdCBjYXNlDQo+PiBmb3IgbW9zdCByZW1haW5p
bmcgY2FsbGVycy4gU29tZSBvZiB0aGUgVFRNLWJhc2VkIGRyaXZlcnMgbWlnaHQNCj4+IGJl
bmVmaXQgZnJvbSBhIGRlZGljYXRlZCBmYmRldiBlbXVsYXRpb24gdGhhdCBvcGVyYXRlcyBk
aXJlY3RseSBvbg0KPj4gdGhlIGRyaXZlcidzIHZpZGVvIG1lbW9yeS4NCj4gDQo+IEkgZG9u
J3QgdW5kZXJzdGFuZCBoZXJlLMKgIHRoZSBUVE0tYmFzZWQgZHJpdmVycyBzaG91bGQgaGF2
ZSBlcXVpdmFsZW50IA0KPiBwZXJmb3JtYW5jZQ0KPiANCj4gd2l0aCB5b3UgaW1wbGVtZW50
LiBCZWNhdXNlIGRldmljZSBtZW1vcnkgdHlwaWNhbGx5IHZlcnkgc2xvdyBmb3IgY3B1IA0K
PiByZWFkLCBhdCBsZWFzdA0KPiANCj4gdGhpcyBpcyB0cnVlIGZvciBNaXBzIGFuZCBsb29u
Z2FyY2ggYXJjaGl0ZWN0dXJlLsKgIFRUTS1iYXNlZCBkcml2ZXJzIGZvciANCj4gdGhvc2Ug
cGxhdGZvcm0NCj4gDQo+IGlzIGFsc28gcHJlZmVyIHRvIHJlbmRlciB0byBzeXN0ZW0gcmFt
IGZpcnN0KGZvciBmYXN0IHJlYWRpbmcgYW5kIA0KPiBjb21wb3NpdGluZykgYW5kIHRoZW4N
Cj4gDQo+IGJsaXQgdG8gdGhlIHJlYWwgZnJhbWVidWZmZXIgcGlubmVkIHRvIFZSQU0uDQoN
ClJpZ2h0LiBCdXQgaW4gcHJhY3RpY2UsIHdyaXRpbmcgdGhlIGNvbnNvbGUgZGlyZWN0bHkg
dG8gdGhlIHZpZGVvIHJhbSBpcyANCnBlcmNlaXZlZCBhcyBmYXN0ZXIuIFRoZSBzaGFkb3cg
YnVmZmVyIG5lZWRzIGFuIGFkZGl0aW9uYWwgbWVtY3B5IHRvIHRoZSANCnZpZGVvIHJhbS4g
VGhhdCBhZGRzIGxhdGVuY3kgdG8gdGhlIG91dHB1dC4gSXQncyBtb3JlIGEgc2xvd25lc3Mg
aW4gDQpwZXJjZXB0aW9uIHRoYW4gaW4gYWN0dWFsIEkvTyBhY2Nlc3MuDQoNClRoZSBkcmF3
aW5nIGhlbHBlcnMgZm9yIHN5c3RlbSBtZW1vcnkgaGF2ZSBhbHNvIGJlZW4gc2xvdyBjb21w
YXJlZCB0byANCnRoZSBoZWxwZXIgZm9yIEkvTyBtZW1vcnkuIEkndmUgZml4ZWQgc29tZSBv
ZiBpdCwgYnV0IEknbSBub3Qgc3VyZSBpZiBJIA0KY292ZXJlZCBhbGwgY2FzZXMuIFNlZSBb
MV0gZm9yIHRoZSBwYXRjaGVzLg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy8xMDAzMTcvDQoNCkFuZCBmaW5hbGx5LCB3aXRoIHRoZSBmYmRldiBi
dWZmZXIgaW4gdmlkZW8gbWVtb3J5LCBkcml2ZXJzIGNvdWxkIA0KdXRpbGl6ZSBoYXJkd2Fy
ZSBibGl0dGluZyB0byBmdXJ0aGVyIHNwZWVkIHVwIGRyYXdpbmcuIEFsdGhvdWdoIG5vdCBt
YW55IA0KZHJpdmVycyBldmVyIGRpZCB0aGlzLg0KDQo+IA0KPiANCj4gSW4gdHVybiwgSSB0
aGluayBzaG1lbSBoZWxwZXIgYmFzZWQgZHJpdmVycyBtaWdodCBiZW5lZml0IGZyb20gYSAN
Cj4gZGVkaWNhdGVkIGZiZGV2IGVtdWxhdGlvbi4NCj4gDQo+IEJlY2F1c2UgeW91IGFyZSBi
bGl0IHRvIHRoZSBzaGFkb3cgb2YgdGhlIHZpZGVvIG1lbW9yeSBmb3Igc2htZW0gaGVscGVy
IA0KPiBiYXNlZCBkcml2ZXIuIFRoZQ0KPiANCj4gZHJpdmVyIG1heSBuZWVkIGFub3RoZXIg
YmxpdCB0byB0aGUgdWx0aW1hdGUgZnJhbWVidWZmZXIuwqAgVXNpbmcgYSANCg0KSW5kZWVk
LiBTSE1FTSBoYXMgdHdvIG1lbWNweSBvcGVyYXRpb25zLiBJZiB3ZSBjb3VsZCByZW1vdmUg
dGhlIGZiZGV2IA0Kc2hhZG93IGJ1ZmZlciBhbmQgb3BlcmF0ZSBvbiB0aGUgU0hNRU0gYnVm
ZmVyIGRpcmVjdGx5LCB3ZSdkIHJlZHVjZSANCm92ZXJoZWFkLg0KDQpJdCB3b3VsZCBhbHNv
IG1lYW4gdGhhdCB3ZSdkIG1tYXAgdGhlIFNITUVNIHBhZ2VzIHRvIGZiZGV2J3MgdXNlcnNw
YWNlLiANCkkndmUgbm90IHlldCBtYW5hZ2VkIHRvIGltcGxlbWVudCB0aGlzIHN1Y2Nlc3Nm
dWxseSwgYXMgaXQgd291bGQgcmVxdWlyZSANCm5ldyBtbWFwIGNvZGUgaW4gdGhlIEdFTSBT
SE1FTSBvYmplY3QgZm9yIHRoaXMgcHVycG9zZS4gQW5kIHNvIGZhciwgSSd2ZSANCmFsd2F5
cyByYW4gaW50byBhIGJ1ZyB3aGVyZSB0aGUgZmJkZXYgZW11bGF0aW9uIHdvdWxkIGVuZCB1
cCBpbiBhIA0KY29ycnVwdCBzdGF0ZS4NCg0KSSd2ZSBzcGVuZCB0aW1lIG9uICdmYmRldi1z
aG1lbScgZW11bGF0aW9uLCBidXQgZ2l2ZW4gdGhlIHByb2JsZW1zLCBpdCANCmhhc24ndCBw
YWlkIG9mZiBzbyBmYXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gc2hhZG93IGJ1
ZmZlciBpcyBzdGlsbCBhY2NlcHRhYmxlDQo+IA0KPiB0aG91Z2gsIGJ1dCB3aHnCoCBkbyB5
b3Ugc2F5ICJ0aGUgVFRNLWJhc2VkIGRyaXZlcnMgbWlnaHQgYmVuZWZpdCBmcm9tIGEgDQo+
IGRlZGljYXRlZCBmYmRldiBlbXVsYXRpb24iID8NCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZpZXdl
ZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
PiBBY2tlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4+IC0tLQ0KPj4g
wqAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgfCAxODQgKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlv
bnMoKyksIDE1NCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJkZXZfZ2VuZXJpYy5jDQo+PiBpbmRleCA0ZDYzMjVlOTE1NjUuLmU0OGE4ZTgyMzc4ZCAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4gQEAgLTEx
LDE2ICsxMSw2IEBADQo+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV9mYmRldl9nZW5lcmljLmg+
DQo+PiAtc3RhdGljIGJvb2wgZHJtX2ZiZGV2X3VzZV9zaGFkb3dfZmIoc3RydWN0IGRybV9m
Yl9oZWxwZXIgKmZiX2hlbHBlcikNCj4+IC17DQo+PiAtwqDCoMKgIHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBmYl9oZWxwZXItPmRldjsNCj4+IC3CoMKgwqAgc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIgPSBmYl9oZWxwZXItPmZiOw0KPj4gLQ0KPj4gLcKgwqDCoCByZXR1cm4g
ZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJfc2hhZG93X2ZiZGV2IHx8DQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJfc2hhZG93IHx8DQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmItPmZ1bmNzLT5kaXJ0eTsNCj4+IC19DQo+PiAtDQo+PiDC
oCAvKiBAdXNlcjogMT11c2Vyc3BhY2UsIDA9ZmJjb24gKi8NCj4+IMKgIHN0YXRpYyBpbnQg
ZHJtX2ZiZGV2X2ZiX29wZW4oc3RydWN0IGZiX2luZm8gKmluZm8sIGludCB1c2VyKQ0KPj4g
wqAgew0KPj4gQEAgLTQ2LDExNSArMzYsMzMgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZmJf
cmVsZWFzZShzdHJ1Y3QgZmJfaW5mbyANCj4+ICppbmZvLCBpbnQgdXNlcikNCj4+IMKgIHN0
YXRpYyB2b2lkIGRybV9mYmRldl9mYl9kZXN0cm95KHN0cnVjdCBmYl9pbmZvICppbmZvKQ0K
Pj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVy
ID0gaW5mby0+cGFyOw0KPj4gLcKgwqDCoCB2b2lkICpzaGFkb3cgPSBOVUxMOw0KPj4gK8Kg
wqDCoCB2b2lkICpzaGFkb3cgPSBpbmZvLT5zY3JlZW5fYnVmZmVyOw0KPj4gwqDCoMKgwqDC
oCBpZiAoIWZiX2hlbHBlci0+ZGV2KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsN
Cj4+IC3CoMKgwqAgaWYgKGluZm8tPmZiZGVmaW8pDQo+PiAtwqDCoMKgwqDCoMKgwqAgZmJf
ZGVmZXJyZWRfaW9fY2xlYW51cChpbmZvKTsNCj4+IC3CoMKgwqAgaWYgKGRybV9mYmRldl91
c2Vfc2hhZG93X2ZiKGZiX2hlbHBlcikpDQo+PiAtwqDCoMKgwqDCoMKgwqAgc2hhZG93ID0g
aW5mby0+c2NyZWVuX2J1ZmZlcjsNCj4+IC0NCj4+ICvCoMKgwqAgZmJfZGVmZXJyZWRfaW9f
Y2xlYW51cChpbmZvKTsNCj4+IMKgwqDCoMKgwqAgZHJtX2ZiX2hlbHBlcl9maW5pKGZiX2hl
bHBlcik7DQo+PiAtDQo+PiAtwqDCoMKgIGlmIChzaGFkb3cpDQo+PiAtwqDCoMKgwqDCoMKg
wqAgdmZyZWUoc2hhZG93KTsNCj4+IC3CoMKgwqAgZWxzZSBpZiAoZmJfaGVscGVyLT5idWZm
ZXIpDQo+PiAtwqDCoMKgwqDCoMKgwqAgZHJtX2NsaWVudF9idWZmZXJfdnVubWFwKGZiX2hl
bHBlci0+YnVmZmVyKTsNCj4+IC0NCj4+ICvCoMKgwqAgdmZyZWUoc2hhZG93KTsNCj4+IMKg
wqDCoMKgwqAgZHJtX2NsaWVudF9mcmFtZWJ1ZmZlcl9kZWxldGUoZmJfaGVscGVyLT5idWZm
ZXIpOw0KPj4gLcKgwqDCoCBkcm1fY2xpZW50X3JlbGVhc2UoJmZiX2hlbHBlci0+Y2xpZW50
KTsNCj4+ICvCoMKgwqAgZHJtX2NsaWVudF9yZWxlYXNlKCZmYl9oZWxwZXItPmNsaWVudCk7
DQo+PiDCoMKgwqDCoMKgIGRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKGZiX2hlbHBlcik7DQo+
PiDCoMKgwqDCoMKgIGtmcmVlKGZiX2hlbHBlcik7DQo+PiDCoCB9DQo+PiAtc3RhdGljIGlu
dCBkcm1fZmJkZXZfZmJfbW1hcChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IA0KPj4g
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4+IC17DQo+PiAtwqDCoMKgIHN0cnVjdCBkcm1fZmJf
aGVscGVyICpmYl9oZWxwZXIgPSBpbmZvLT5wYXI7DQo+PiAtDQo+PiAtwqDCoMKgIGlmIChk
cm1fZmJkZXZfdXNlX3NoYWRvd19mYihmYl9oZWxwZXIpKQ0KPj4gLcKgwqDCoMKgwqDCoMKg
IHJldHVybiBmYl9kZWZlcnJlZF9pb19tbWFwKGluZm8sIHZtYSk7DQo+PiAtwqDCoMKgIGVs
c2UgaWYgKGZiX2hlbHBlci0+ZGV2LT5kcml2ZXItPmdlbV9wcmltZV9tbWFwKQ0KPj4gLcKg
wqDCoMKgwqDCoMKgIHJldHVybiANCj4+IGZiX2hlbHBlci0+ZGV2LT5kcml2ZXItPmdlbV9w
cmltZV9tbWFwKGZiX2hlbHBlci0+YnVmZmVyLT5nZW0sIHZtYSk7DQo+PiAtwqDCoMKgIGVs
c2UNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsNCj4+IC19DQo+PiAtDQo+
PiAtc3RhdGljIGJvb2wgZHJtX2ZiZGV2X3VzZV9pb21lbShzdHJ1Y3QgZmJfaW5mbyAqaW5m
bykNCj4+IC17DQo+PiAtwqDCoMKgIHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIg
PSBpbmZvLT5wYXI7DQo+PiAtwqDCoMKgIHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVm
ZmVyID0gZmJfaGVscGVyLT5idWZmZXI7DQo+PiAtDQo+PiAtwqDCoMKgIHJldHVybiAhZHJt
X2ZiZGV2X3VzZV9zaGFkb3dfZmIoZmJfaGVscGVyKSAmJiBidWZmZXItPm1hcC5pc19pb21l
bTsNCj4+IC19DQo+PiAtDQo+PiAtc3RhdGljIHNzaXplX3QgZHJtX2ZiZGV2X2ZiX3JlYWQo
c3RydWN0IGZiX2luZm8gKmluZm8sIGNoYXIgX191c2VyICpidWYsDQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+
PiAtew0KPj4gLcKgwqDCoCBzc2l6ZV90IHJldDsNCj4+IC0NCj4+IC3CoMKgwqAgaWYgKGRy
bV9mYmRldl91c2VfaW9tZW0oaW5mbykpDQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gZHJt
X2ZiX2hlbHBlcl9jZmJfcmVhZChpbmZvLCBidWYsIGNvdW50LCBwcG9zKTsNCj4+IC3CoMKg
wqAgZWxzZQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IGRybV9mYl9oZWxwZXJfc3lzX3Jl
YWQoaW5mbywgYnVmLCBjb3VudCwgcHBvcyk7DQo+PiAtDQo+PiAtwqDCoMKgIHJldHVybiBy
ZXQ7DQo+PiAtfQ0KPj4gLQ0KPj4gLXN0YXRpYyBzc2l6ZV90IGRybV9mYmRldl9mYl93cml0
ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hhciANCj4+IF9fdXNlciAqYnVmLA0K
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50LCBs
b2ZmX3QgKnBwb3MpDQo+PiAtew0KPj4gLcKgwqDCoCBzc2l6ZV90IHJldDsNCj4+IC0NCj4+
IC3CoMKgwqAgaWYgKGRybV9mYmRldl91c2VfaW9tZW0oaW5mbykpDQo+PiAtwqDCoMKgwqDC
oMKgwqAgcmV0ID0gZHJtX2ZiX2hlbHBlcl9jZmJfd3JpdGUoaW5mbywgYnVmLCBjb3VudCwg
cHBvcyk7DQo+PiAtwqDCoMKgIGVsc2UNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBkcm1f
ZmJfaGVscGVyX3N5c193cml0ZShpbmZvLCBidWYsIGNvdW50LCBwcG9zKTsNCj4+IC0NCj4+
IC3CoMKgwqAgcmV0dXJuIHJldDsNCj4+IC19DQo+PiAtDQo+PiAtc3RhdGljIHZvaWQgZHJt
X2ZiZGV2X2ZiX2ZpbGxyZWN0KHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGZiX2ZpbGxyZWN0ICpy
ZWN0KQ0KPj4gLXsNCj4+IC3CoMKgwqAgaWYgKGRybV9mYmRldl91c2VfaW9tZW0oaW5mbykp
DQo+PiAtwqDCoMKgwqDCoMKgwqAgZHJtX2ZiX2hlbHBlcl9jZmJfZmlsbHJlY3QoaW5mbywg
cmVjdCk7DQo+PiAtwqDCoMKgIGVsc2UNCj4+IC3CoMKgwqDCoMKgwqDCoCBkcm1fZmJfaGVs
cGVyX3N5c19maWxscmVjdChpbmZvLCByZWN0KTsNCj4+IC19DQo+PiAtDQo+PiAtc3RhdGlj
IHZvaWQgZHJtX2ZiZGV2X2ZiX2NvcHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGZiX2Nv
cHlhcmVhICphcmVhKQ0KPj4gLXsNCj4+IC3CoMKgwqAgaWYgKGRybV9mYmRldl91c2VfaW9t
ZW0oaW5mbykpDQo+PiAtwqDCoMKgwqDCoMKgwqAgZHJtX2ZiX2hlbHBlcl9jZmJfY29weWFy
ZWEoaW5mbywgYXJlYSk7DQo+PiAtwqDCoMKgIGVsc2UNCj4+IC3CoMKgwqDCoMKgwqDCoCBk
cm1fZmJfaGVscGVyX3N5c19jb3B5YXJlYShpbmZvLCBhcmVhKTsNCj4+IC19DQo+PiAtDQo+
PiAtc3RhdGljIHZvaWQgZHJtX2ZiZGV2X2ZiX2ltYWdlYmxpdChzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qg
c3RydWN0IGZiX2ltYWdlICppbWFnZSkNCj4+IC17DQo+PiAtwqDCoMKgIGlmIChkcm1fZmJk
ZXZfdXNlX2lvbWVtKGluZm8pKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIGRybV9mYl9oZWxwZXJf
Y2ZiX2ltYWdlYmxpdChpbmZvLCBpbWFnZSk7DQo+PiAtwqDCoMKgIGVsc2UNCj4+IC3CoMKg
wqDCoMKgwqDCoCBkcm1fZmJfaGVscGVyX3N5c19pbWFnZWJsaXQoaW5mbywgaW1hZ2UpOw0K
Pj4gLX0NCj4+IC0NCj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGRybV9mYmRl
dl9mYl9vcHMgPSB7DQo+PiDCoMKgwqDCoMKgIC5vd25lcsKgwqDCoMKgwqDCoMKgID0gVEhJ
U19NT0RVTEUsDQo+PiAtwqDCoMKgIERSTV9GQl9IRUxQRVJfREVGQVVMVF9PUFMsDQo+PiDC
oMKgwqDCoMKgIC5mYl9vcGVuwqDCoMKgID0gZHJtX2ZiZGV2X2ZiX29wZW4sDQo+PiDCoMKg
wqDCoMKgIC5mYl9yZWxlYXNlwqDCoMKgID0gZHJtX2ZiZGV2X2ZiX3JlbGVhc2UsDQo+PiAr
wqDCoMKgIC5mYl9yZWFkwqDCoMKgID0gZHJtX2ZiX2hlbHBlcl9zeXNfcmVhZCwNCj4+ICvC
oMKgwqAgLmZiX3dyaXRlwqDCoMKgID0gZHJtX2ZiX2hlbHBlcl9zeXNfd3JpdGUsDQo+PiAr
wqDCoMKgIERSTV9GQl9IRUxQRVJfREVGQVVMVF9PUFMsDQo+PiArwqDCoMKgIC5mYl9maWxs
cmVjdMKgwqDCoCA9IGRybV9mYl9oZWxwZXJfc3lzX2ZpbGxyZWN0LA0KPj4gK8KgwqDCoCAu
ZmJfY29weWFyZWHCoMKgwqAgPSBkcm1fZmJfaGVscGVyX3N5c19jb3B5YXJlYSwNCj4+ICvC
oMKgwqAgLmZiX2ltYWdlYmxpdMKgwqDCoCA9IGRybV9mYl9oZWxwZXJfc3lzX2ltYWdlYmxp
dCwNCj4+ICvCoMKgwqAgLmZiX21tYXDCoMKgwqAgPSBmYl9kZWZlcnJlZF9pb19tbWFwLA0K
Pj4gwqDCoMKgwqDCoCAuZmJfZGVzdHJvecKgwqDCoCA9IGRybV9mYmRldl9mYl9kZXN0cm95
LA0KPj4gLcKgwqDCoCAuZmJfbW1hcMKgwqDCoCA9IGRybV9mYmRldl9mYl9tbWFwLA0KPj4g
LcKgwqDCoCAuZmJfcmVhZMKgwqDCoCA9IGRybV9mYmRldl9mYl9yZWFkLA0KPj4gLcKgwqDC
oCAuZmJfd3JpdGXCoMKgwqAgPSBkcm1fZmJkZXZfZmJfd3JpdGUsDQo+PiAtwqDCoMKgIC5m
Yl9maWxscmVjdMKgwqDCoCA9IGRybV9mYmRldl9mYl9maWxscmVjdCwNCj4+IC3CoMKgwqAg
LmZiX2NvcHlhcmVhwqDCoMKgID0gZHJtX2ZiZGV2X2ZiX2NvcHlhcmVhLA0KPj4gLcKgwqDC
oCAuZmJfaW1hZ2VibGl0wqDCoMKgID0gZHJtX2ZiZGV2X2ZiX2ltYWdlYmxpdCwNCj4+IMKg
IH07DQo+PiDCoCAvKg0KPj4gQEAgLTE2OSw3ICs3Nyw2IEBAIHN0YXRpYyBpbnQgZHJtX2Zi
ZGV2X2ZiX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyIA0KPj4gKmZiX2hlbHBlciwNCj4+
IMKgwqDCoMKgwqAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmI7DQo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBmYl9pbmZvICppbmZvOw0KPj4gwqDCoMKgwqDCoCB1MzIgZm9ybWF0Ow0KPj4g
LcKgwqDCoCBzdHJ1Y3QgaW9zeXNfbWFwIG1hcDsNCj4+IMKgwqDCoMKgwqAgaW50IHJldDsN
Cj4+IMKgwqDCoMKgwqAgZHJtX2RiZ19rbXMoZGV2LCAic3VyZmFjZSB3aWR0aCglZCksIGhl
aWdodCglZCkgYW5kIGJwcCglZClcbiIsDQo+PiBAQCAtMTk3LDQ0ICsxMDQsMjEgQEAgc3Rh
dGljIGludCBkcm1fZmJkZXZfZmJfcHJvYmUoc3RydWN0IA0KPj4gZHJtX2ZiX2hlbHBlciAq
ZmJfaGVscGVyLA0KPj4gwqDCoMKgwqDCoCBkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhpbmZv
LCBmYl9oZWxwZXIsIHNpemVzKTsNCj4+IC3CoMKgwqAgaWYgKGRybV9mYmRldl91c2Vfc2hh
ZG93X2ZiKGZiX2hlbHBlcikpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBpbmZvLT5zY3JlZW5f
YnVmZmVyID0gdnphbGxvYyhpbmZvLT5zY3JlZW5fc2l6ZSk7DQo+PiAtwqDCoMKgwqDCoMKg
wqAgaWYgKCFpbmZvLT5zY3JlZW5fYnVmZmVyKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9NRU07DQo+PiAtwqDCoMKgwqDCoMKgwqAgaW5mby0+ZmxhZ3MgfD0g
RkJJTkZPX1ZJUlRGQiB8IEZCSU5GT19SRUFEU19GQVNUOw0KPj4gK8KgwqDCoCBpbmZvLT5z
Y3JlZW5fYnVmZmVyID0gdnphbGxvYyhpbmZvLT5zY3JlZW5fc2l6ZSk7DQo+PiArwqDCoMKg
IGlmICghaW5mby0+c2NyZWVuX2J1ZmZlcikNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVOT01FTTsNCj4+ICvCoMKgwqAgaW5mby0+ZmxhZ3MgfD0gRkJJTkZPX1ZJUlRGQiB8IEZC
SU5GT19SRUFEU19GQVNUOw0KPj4gLcKgwqDCoMKgwqDCoMKgIC8qIFNldCBhIGRlZmF1bHQg
ZGVmZXJyZWQgSS9PIGhhbmRsZXIgKi8NCj4+IC3CoMKgwqDCoMKgwqDCoCBmYl9oZWxwZXIt
PmZiZGVmaW8uZGVsYXkgPSBIWiAvIDIwOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGZiX2hlbHBl
ci0+ZmJkZWZpby5kZWZlcnJlZF9pbyA9IGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW87DQo+
PiArwqDCoMKgIGluZm8tPmZpeC5zbWVtX3N0YXJ0ID0gDQo+PiBwYWdlX3RvX3BoeXModm1h
bGxvY190b19wYWdlKGluZm8tPnNjcmVlbl9idWZmZXIpKTsNCj4gDQo+IFdoecKgIHNpbXBs
eSB1c2XCoCBzY3JlZW5fYnVmZmVyIGluc3RlYWQgb2YgaW5mby0+c2NyZWVuX2J1ZmZlciBo
ZXJlID8NCj4gDQo+IGluZm8tPmZpeC5zbWVtX3N0YXJ0ID0gcGFnZV90b19waHlzKHZtYWxs
b2NfdG9fcGFnZShzY3JlZW5fYnVmZmVyKSk7DQo+IA0KPiBJJ20gYXNraW5nIGJlY2F1c2Ug
SSBzZWUgeW91IHVzZSB2ZnJlZShzY3JlZW5fYnVmZmVyKSBiZWxvdyB0aGUgDQo+IGVycl92
ZnJlZSBsYWJlbCBpbiB0aGlzIGZ1bmN0aW9uLg0KPiANCj4gDQo+IEkgYWxzbyB3YW50IHRv
IGFzayBhbm90aGVyIHF1ZXN0aW9uIGhlcmU6DQo+IEkgaGVhcmQsLy90aGUvIC9tZW1vcnkv
IC9hbGxvY2F0ZWQvIC9ieS8vKi8vdnphbGxvYy8vKi8vaXMvIC9ub3QvIA0KPiAvcGh5c2lj
YWxseS8gL2NvbnRpZ3VvdXMvLiAvV2h5IHN1Y2ggYSB2aXJ0dWFsIGFkZHJlc3MgY2FuIGNv
bnZlcnQgdG8gDQo+IHBoeXNpY2FsIGFkZHJlc3MgYnkvL3BhZ2VfdG9fcGh5cyh2bWFsbG9j
X3RvX3BhZ2UoKSk/Ly9Eb2VzIGl0IGxlZ2FsIGZvciANCj4gYSBHUFUgd2l0aG91dCBNTVUg
YWNjZXNzaW5nIHN1Y2ggYSBwaHlzaWNhbCBhZGRyZXNzIGxlYWtlZCB0byB1c2VyLXNwYWNl
Pw0KPiANCj4+IC3CoMKgwqDCoMKgwqDCoCBpbmZvLT5mYmRlZmlvID0gJmZiX2hlbHBlci0+
ZmJkZWZpbzsNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBmYl9kZWZlcnJlZF9pb19pbml0
KGluZm8pOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gLcKgwqDCoCB9IGVsc2Ugew0KPj4gLcKgwqDC
oMKgwqDCoMKgIC8qIGJ1ZmZlciBpcyBtYXBwZWQgZm9yIEhXIGZyYW1lYnVmZmVyICovDQo+
PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gZHJtX2NsaWVudF9idWZmZXJfdm1hcChmYl9oZWxw
ZXItPmJ1ZmZlciwgJm1hcCk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+PiAtwqDCoMKgwqDCoMKgwqAg
aWYgKG1hcC5pc19pb21lbSkgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5mby0+
c2NyZWVuX2Jhc2UgPSBtYXAudmFkZHJfaW9tZW07DQo+PiAtwqDCoMKgwqDCoMKgwqAgfSBl
bHNlIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluZm8tPnNjcmVlbl9idWZmZXIg
PSBtYXAudmFkZHI7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmZvLT5mbGFncyB8
PSBGQklORk9fVklSVEZCOw0KPj4gLcKgwqDCoMKgwqDCoMKgIH0NCj4+IC0NCj4+IC3CoMKg
wqDCoMKgwqDCoCAvKg0KPj4gLcKgwqDCoMKgwqDCoMKgwqAgKiBTaGFtZWxlc3NseSBsZWFr
IHRoZSBwaHlzaWNhbCBhZGRyZXNzIHRvIHVzZXItc3BhY2UuIEFzDQo+PiAtwqDCoMKgwqDC
oMKgwqDCoCAqIHBhZ2VfdG9fcGh5cygpIGlzIHVuZGVmaW5lZCBmb3IgSS9PIG1lbW9yeSwg
d2FybiBpbiB0aGlzDQo+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIGNhc2UuDQo+PiAtwqDCoMKg
wqDCoMKgwqDCoCAqLw0KPj4gLSNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fRkJERVZfTEVB
S19QSFlTX1NNRU0pDQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGZiX2hlbHBlci0+aGludF9s
ZWFrX3NtZW1fc3RhcnQgJiYgaW5mby0+Zml4LnNtZW1fc3RhcnQgDQo+PiA9PSAwICYmDQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhZHJtX1dBUk5fT05fT05DRShkZXYsIG1hcC5p
c19pb21lbSkpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmZvLT5maXguc21lbV9z
dGFydCA9DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2VfdG9fcGh5
cyh2aXJ0X3RvX3BhZ2UoaW5mby0+c2NyZWVuX2J1ZmZlcikpOw0KPj4gLSNlbmRpZg0KPj4g
LcKgwqDCoCB9DQo+PiArwqDCoMKgIC8qIFNldCBhIGRlZmF1bHQgZGVmZXJyZWQgSS9PIGhh
bmRsZXIgKi8NCj4+ICvCoMKgwqAgZmJfaGVscGVyLT5mYmRlZmlvLmRlbGF5ID0gSFogLyAy
MDsNCj4+ICvCoMKgwqAgZmJfaGVscGVyLT5mYmRlZmlvLmRlZmVycmVkX2lvID0gZHJtX2Zi
X2hlbHBlcl9kZWZlcnJlZF9pbzsNCj4+ICsNCj4+ICvCoMKgwqAgaW5mby0+ZmJkZWZpbyA9
ICZmYl9oZWxwZXItPmZiZGVmaW87DQo+PiArwqDCoMKgIHJldCA9IGZiX2RlZmVycmVkX2lv
X2luaXQoaW5mbyk7DQo+PiArwqDCoMKgIGlmIChyZXQpDQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsNCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiDCoCB9DQo+PiBAQCAt
MzE4LDE4ICsyMDIsMTMgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZmJfZGlydHkoc3RydWN0
IA0KPj4gZHJtX2ZiX2hlbHBlciAqaGVscGVyLCBzdHJ1Y3QgZHJtX2NsaXBfcmVjdA0KPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gaGVscGVyLT5kZXY7DQo+PiDC
oMKgwqDCoMKgIGludCByZXQ7DQo+PiAtwqDCoMKgIGlmICghZHJtX2ZiZGV2X3VzZV9zaGFk
b3dfZmIoaGVscGVyKSkNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IC0NCj4+
IMKgwqDCoMKgwqAgLyogQ2FsbCBkYW1hZ2UgaGFuZGxlcnMgb25seSBpZiBuZWNlc3Nhcnkg
Ki8NCj4+IMKgwqDCoMKgwqAgaWYgKCEoY2xpcC0+eDEgPCBjbGlwLT54MiAmJiBjbGlwLT55
MSA8IGNsaXAtPnkyKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IC3C
oMKgwqAgaWYgKGhlbHBlci0+YnVmZmVyKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0g
ZHJtX2ZiZGV2X2RhbWFnZV9ibGl0KGhlbHBlciwgY2xpcCk7DQo+PiAtwqDCoMKgwqDCoMKg
wqAgaWYgKGRybV9XQVJOX09OQ0UoZGV2LCByZXQsICJEYW1hZ2UgYmxpdHRlciBmYWlsZWQ6
IA0KPj4gcmV0PSVkXG4iLCByZXQpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIHJldDsNCj4+IC3CoMKgwqAgfQ0KPj4gK8KgwqDCoCByZXQgPSBkcm1fZmJkZXZfZGFt
YWdlX2JsaXQoaGVscGVyLCBjbGlwKTsNCj4+ICvCoMKgwqAgaWYgKGRybV9XQVJOX09OQ0Uo
ZGV2LCByZXQsICJEYW1hZ2UgYmxpdHRlciBmYWlsZWQ6IHJldD0lZFxuIiwgcmV0KSkNCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gwqDCoMKgwqDCoCBpZiAoaGVscGVy
LT5mYi0+ZnVuY3MtPmRpcnR5KSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gaGVs
cGVyLT5mYi0+ZnVuY3MtPmRpcnR5KGhlbHBlci0+ZmIsIE5VTEwsIDAsIDAsIGNsaXAsIA0K
Pj4gMSk7DQo+PiBAQCAtNDE1LDEyICsyOTQsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9jbGllbnRfZnVuY3MgDQo+PiBkcm1fZmJkZXZfY2xpZW50X2Z1bmNzID0gew0KPj4gwqDC
oCAqIHN1c3BlbmQvcmVzdW1lIG5lZWQgdG8gY2FsbCBkcm1fZmJfaGVscGVyX3NldF9zdXNw
ZW5kX3VubG9ja2VkKCkgDQo+PiB0aGVtc2VsdmVzLg0KPj4gwqDCoCAqIFNpbXBsZSBkcml2
ZXJzIG1pZ2h0IHVzZSBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1c3BlbmQoKS4NCj4+IMKg
wqAgKg0KPj4gLSAqIERyaXZlcnMgdGhhdCBzZXQgdGhlIGRpcnR5IGNhbGxiYWNrIG9uIHRo
ZWlyIGZyYW1lYnVmZmVyIHdpbGwgZ2V0IA0KPj4gYSBzaGFkb3cNCj4+IC0gKiBmYmRldiBi
dWZmZXIgdGhhdCBpcyBibGl0dGVkIG9udG8gdGhlIHJlYWwgYnVmZmVyLiBUaGlzIGlzIGRv
bmUgaW4gDQo+PiBvcmRlciB0bw0KPj4gLSAqIG1ha2UgZGVmZXJyZWQgSS9PIHdvcmsgd2l0
aCBhbGwga2luZHMgb2YgYnVmZmVycy4gQSBzaGFkb3cgYnVmZmVyIA0KPj4gY2FuIGJlDQo+
PiAtICogcmVxdWVzdGVkIGV4cGxpY2l0bHkgYnkgc2V0dGluZyBzdHJ1Y3QgDQo+PiBkcm1f
bW9kZV9jb25maWcucHJlZmVyX3NoYWRvdyBvcg0KPj4gLSAqIHN0cnVjdCBkcm1fbW9kZV9j
b25maWcucHJlZmVyX3NoYWRvd19mYmRldiB0byB0cnVlIGJlZm9yZWhhbmQuIA0KPj4gVGhp
cyBpcw0KPj4gLSAqIHJlcXVpcmVkIHRvIHVzZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiB3
aXRoIFNITUVNIGhlbHBlcnMuDQo+PiArICogSW4gb3JkZXIgdG8gcHJvdmlkZSBmaXhlZCBt
bWFwLWFibGUgbWVtb3J5IHJhbmdlcywNCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCBoZXJl
LCB3aGF0IGRvIHlvdSBtZWFuIGFib3V0ICpmaXhlZCo/DQo+IA0KPiBmaXhlZCByZWxhdGl2
ZSB0byB3aGF0PyBDYW4geW91IHNheSBtb3JlPw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------L0S86at30PKR50HDDd8qI5N5--

--------------2dr4o4FjGBAAB8ZK39PLd6tK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQaAbcFAwAAAAAACgkQlh/E3EQov+Dm
aA//bEQlXs2O5THu2vD6lWAgLGEFrhYMDWNIOlfzXqseTFRyVMJ060K0f/D1zMV+kzXa2xRT/1p2
NF2Cx6uOWLfZKxXhBZC+6Mna7X47mmjFnkfqSiiu/v5Js4DRpCbChohOeBt+IRg+C0ynLSWTPsbU
pnPrR34SKHoPHRKk51Ib2YGShIFpTCsx5AJIkAkawHkhkuK7FWYDG0a2DCx4cHXghfiVfOCNQKQO
Mya0OmlEKF9QVrxzpgLoP5o30VyahrKyOhHGtbds//E7K9Z/q1a4yYZYQC/EqoHiIH+PpGIFK4aI
eNGS3zlBKRJlNvW5TVsKJAlBKBd5Dg3bvzt4Q94TW9DyMiPwIdkjEtq7XAzlFDEP2Ql5IFg4lWVp
Vv7xRquLZHjrKY4ilu/chIGUtPNlBdg4MVMlnnIpU/YISBdz8M3IjWW6NzjDAfYseYxgI1dgigUn
imC+Zfuth+ZXoETj2b87xZrOue2nZspfVfeFHNgy3nGY3U5W9O3fQKuDSQAjAAiagysE/BNDvaiN
qUteuBLCha3svxlyXZUmB1wCo4FNVWlllDDSmAIql1oxXH0Y+9w6wGOoxdHM5vkXfCtus9Nuf0r1
S+KvcvhdO9LgrZNJLIZvZQatWxqx0iwPGGvXtyvjl20/cxB7Tx5bSly2rUQU+H/Aw9xfbLfCAC/n
icM=
=xMZ2
-----END PGP SIGNATURE-----

--------------2dr4o4FjGBAAB8ZK39PLd6tK--

--===============2339365911665535946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2339365911665535946==--
