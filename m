Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F9F31B
	for <lists.virtualization@lfdr.de>; Tue, 30 Apr 2019 11:36:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6742EF0D;
	Tue, 30 Apr 2019 09:36:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6F1EEFE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 09:35:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 37F0B71C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2cATgUx86Z/EC0vDHwPkl+ucT41YI9hKO0qZkRTAJ38=;
	b=tX+2BLP3Oi6JqGYQlMlL9PtchdU395nES7dUXi/8UdC7ARmQqOibFGvnz2fpjprn5IMIY37Q5SWATGJGpKMZn020Sy2xFiVb+XeAN1+Ff27pfg0Y5CFq8W8b1Vu+GwJTlV7R0X/x/QPiaZ3GZW30ycX9TDujhNOFGf0UVgLkWJA=
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
	DM5PR12MB2488.namprd12.prod.outlook.com (52.132.141.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1835.12; Tue, 30 Apr 2019 09:35:33 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
	([fe80::70fc:f26c:1e22:73ba]) by
	DM5PR12MB1546.namprd12.prod.outlook.com
	([fe80::70fc:f26c:1e22:73ba%10]) with mapi id 15.20.1835.010;
	Tue, 30 Apr 2019 09:35:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Thread-Topic: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and
	helpers
Thread-Index: AQHU/pojWq8imvWZyUydqtyEboEK56ZTjr6AgADg3NuAAANEAA==
Date: Tue, 30 Apr 2019 09:35:33 +0000
Message-ID: <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
References: <20190429144341.12615-1-tzimmermann@suse.de>
	<20190429144341.12615-2-tzimmermann@suse.de>
	<20190429195855.GA6610@ravnborg.org>
	<1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
	<20190430092327.GA13757@ravnborg.org>
In-Reply-To: <20190430092327.GA13757@ravnborg.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR0402CA0017.eurprd04.prod.outlook.com
	(2603:10a6:203:90::27) To DM5PR12MB1546.namprd12.prod.outlook.com
	(2603:10b6:4:8::23)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a821454-2eca-4dc6-0345-08d6cd4f30dd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:DM5PR12MB2488; 
x-ms-traffictypediagnostic: DM5PR12MB2488:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR12MB24880369350CDD56C4BCF4D7833A0@DM5PR12MB2488.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(346002)(366004)(39860400002)(136003)(51914003)(199004)(189003)(6436002)(65806001)(5660300002)(65956001)(99286004)(81166006)(229853002)(97736004)(8676002)(81156014)(31696002)(6512007)(66556008)(316002)(52116002)(58126008)(6486002)(68736007)(8936002)(110136005)(76176011)(6116002)(86362001)(66476007)(66446008)(64756008)(54906003)(73956011)(66946007)(102836004)(386003)(93886005)(53936002)(6506007)(186003)(71190400001)(2906002)(7736002)(305945005)(4326008)(486006)(7416002)(65826007)(256004)(14444005)(64126003)(31686004)(478600001)(72206003)(2616005)(446003)(46003)(11346002)(6246003)(71200400001)(25786009)(14454004)(476003)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2488;
	H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C2xc1/Q2y2iE0UJfDSS4mVspyxbSdS0Xebn2Y9pFvw+fXf+BlbE1ueBW3ID+fHT8DFLUYgrvxqWVRx/jTMcPgP2/xqi91TDiJCt5Hd0L6uVLhAZxFZxwZGTyGBT2Ix9CrqPW6DBHcwfGVx0NIqiTu7O4etJfUPfIirWlfyiM59CIHbfSMkd5ucvlaqdmGjsfW52snLa51UOiRDMl2qlqgaB+L3v/OFiSFVwr0a4q1vOoEryKJgaiv2Ox+/+NiqVfRbVDIhKZrtyfTbeXPOxLQlo9BPnjsJCPigdmn2ZR4ZXPOdzOkX65dVJQ6m9/o0NBmDnaOOsqzbMcTpPHsw3ZuEdmMPqkhXHhbcWLZN3+0MWbAn2j9ghkjkmDvaW/vQfgAhpU/Ca7149lJg0RRYGBPNaTXIQBJXSvJrfNcM1vk0k=
Content-ID: <FFF87B914E479B42AFD5434C88750B98@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a821454-2eca-4dc6-0345-08d6cd4f30dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 09:35:33.1069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2488
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "airlied@linux.ie" <airlied@linux.ie>,
	"puck.chen@hisilicon.com" <puck.chen@hisilicon.com>, "Zhang,
	Jerry" <Jerry.Zhang@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"zourongrong@gmail.com" <zourongrong@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Am 30.04.19 um 11:23 schrieb Sam Ravnborg:
> [CAUTION: External Email]
>
> Hi Thomas.
>
>>>> +
>>>> +/**
>>>> + * Returns the container of type &struct drm_gem_vram_object
>>>> + * for field bo.
>>>> + * @bo:           the VRAM buffer object
>>>> + * Returns:       The containing GEM VRAM object
>>>> + */
>>>> +static inline struct drm_gem_vram_object* drm_gem_vram_of_bo(
>>>> +  struct ttm_buffer_object *bo)
>>>> +{
>>>> +  return container_of(bo, struct drm_gem_vram_object, bo);
>>>> +}
>>> Indent funny. USe same indent as used in other parts of file for
>>> function arguments.
>> If I put the argument next to the function's name, it will exceed the
>> 80-character limit. From the coding-style document, I could not see what
>> to do in this case. One solution would move the return type to a
>> separate line before the function name. I've not seen that anywhere in
>> the source code, so moving the argument onto a separate line and
>> indenting by one tab appears to be the next best solution. Please let me
>> know if there's if there's a preferred style for cases like this one.
> Readability has IMO higher priority than some limit of 80 chars.
> And it hurts readability (at least my OCD) when style changes
> as you do with indent here. So my personal preference is to fix
> indent and accect longer lines.

In this case the an often used convention (which is also kind of 
readable) is to add a newline after the return values, but before the 
function name. E.g. something like this:

static inline struct drm_gem_vram_object*
drm_gem_vram_of_bo(struct ttm_buffer_object *bo)

Regards,
Christian.

>
> But you ask for a preferred style - which I do not think we have in this
> case. So it boils down to what you prefer.
>
> Enough bikeshedding, thanks for the quick response.
>
>          Sam

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
