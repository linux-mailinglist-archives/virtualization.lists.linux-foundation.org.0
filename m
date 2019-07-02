Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0035CFEB
	for <lists.virtualization@lfdr.de>; Tue,  2 Jul 2019 15:00:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1AFFF1AEA;
	Tue,  2 Jul 2019 13:00:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6F5161AE3
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 12:56:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-eopbgr1320058.outbound.protection.outlook.com [40.107.132.58])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 68822836
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=teoenmingcorp.onmicrosoft.com;
	s=selector1-teoenmingcorp-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=A39Dz4x3nQl+rVHxurE1vf2iNwOzoXPKkSP4xPBmdeY=;
	b=YrzctH42GgIwWXdw5TIbRBY6Hi3xqIOUmhi92BB7v1NZR2IIhUx4gfMOShi48IMXqlQUuhJAbxJANwrmcFZ+Wk9smbDJpFp+fc7tR1Fo/JAP+Tl36L26iRGH1TekIRRHCFHgxfj/ImCnyrClu5D8i2StlKV56rkhGGvegJSo8Bs=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
	SG2PR01MB2983.apcprd01.prod.exchangelabs.com (20.177.91.12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2032.20; Tue, 2 Jul 2019 12:56:22 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
	([fe80::d503:3d71:ce06:19d2]) by
	SG2PR01MB2141.apcprd01.prod.exchangelabs.com
	([fe80::d503:3d71:ce06:19d2%6]) with mapi id 15.20.2032.019;
	Tue, 2 Jul 2019 12:56:22 +0000
From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To: "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
Subject: What are all the different virtualization solutions for Linux?
Thread-Topic: What are all the different virtualization solutions for Linux?
Thread-Index: AdUw1S6t/FOhAengSSS2c2lO9xC+tg==
Date: Tue, 2 Jul 2019 12:56:22 +0000
Message-ID: <SG2PR01MB21414F5E77B7E49670E8444A87F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e91f9887-ef8d-40ae-ab8f-08d6feecaf40
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:SG2PR01MB2983; 
x-ms-traffictypediagnostic: SG2PR01MB2983:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <SG2PR01MB2983D50CFDDC23F7F179FB4687F80@SG2PR01MB2983.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(136003)(396003)(39830400003)(366004)(376002)(189003)(199004)(486006)(68736007)(476003)(25786009)(6916009)(86362001)(102836004)(186003)(26005)(7696005)(107886003)(256004)(6506007)(8936002)(5660300002)(81166006)(2501003)(8676002)(81156014)(1730700003)(74316002)(6306002)(3846002)(305945005)(7736002)(2351001)(4744005)(2906002)(4326008)(6116002)(52536014)(14454004)(66476007)(66556008)(66946007)(64756008)(5640700003)(966005)(55016002)(6436002)(9686003)(626008)(76116006)(53936002)(66066001)(73956011)(99286004)(66446008)(71200400001)(71190400001)(316002)(33656002)(508600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR01MB2983;
	H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uF4vPZOSCgXwdP4eHwIWLYcMufiF+OJ1cyzRdcM0QogDBlER2S9VenZRl/t7bAsnleLyKNWhaAfwRshS6qkZ4KzJS4uoYaoASGJi8erSGVN1mBH/MynD5jSLiSdkVtEjs9vqwo+0DzfMYEk5NpEz6HeKLd7X3UtW2Ne1qcUw+AtDXKgC0xNFg+b8kDF6yA9OheeeVFwk44ffASGKSmhTW+VC8xONkaI8An2465SbYXb0Z1bnS3al8n/ORl5niLDLphtS5qVE1cpuKsz5fjszb+CVyn+HiNCmjnU5y94ot+4kwMvia6dc1m78RTavIjcyVZsZ3nAc9Ua/wQMlZPtPZI+pqsDeK1lQz6/vGZ7guRuIPtqVwFFPAC3oiCqAfJBG8JWL4qVzJKaEzJoksYpS27SBJyr6vA387K6j5UxhF3A=
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91f9887-ef8d-40ae-ab8f-08d6feecaf40
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 12:56:22.4762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2983
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Good evening from Singapore,

What are all the different virtualization solutions for Linux? I can think of:

1. open source Xen project

2. linux-kvm

Are there any others? Is there a comprehensive list of all virtualization solutions for Linux?

Thank you.




-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
